import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../service/simlab_service/simlab_service.dart';
import '../../../state_util.dart';
import '../view/simlab_view.dart';

class SimlabController extends State<SimlabView> implements MvcController {
  static late SimlabController instance;
  late SimlabView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  void resetForm() {
    formKey.currentState!.reset();
    // reset QDatePickers
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String loan = '';
  DateTime? start;
  DateTime? finish;

  doSave() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    try {
      if (start == null || finish == null) {
        throw Exception('Start and finish dates are required.');
      }
      await SimlabService().add(
        fullName: fullName,
        email: email,
        loan: loan,
        start: start!,
        finish: finish!,
      );

      Get.back();
    } on Exception {
      // showInfoDialog("Invalid email");
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('kamu sudah terdaftar!'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2a9235),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          );
        },
      );
    }
  }
}
