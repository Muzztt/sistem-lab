import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tes_2/state_util.dart';
import '../view/datamaster_view.dart';

class DatamasterController extends State<DatamasterView>
    implements MvcController {
  static late DatamasterController instance;
  late DatamasterView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  delete(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance
        .collection("datamaster")
        .doc(item["id"])
        .delete();
  }
}
