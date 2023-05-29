import 'package:flutter/material.dart';
import 'package:tes_2/core.dart';
import '../../../shared/util/validator/validator.dart';
import '../../../shared/widget/date_picker/date_picker.dart';
import '../../../shared/widget/dropdown/dropdown.dart';
import '../../../shared/widget/textfield/textfield.dart';
import '../controller/simlab_controller.dart';

class SimlabView extends StatefulWidget {
  const SimlabView({Key? key}) : super(key: key);

  Widget build(context, SimlabController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Color(0xffe6fbe3),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.asset(
                    "assets/images/loan.png",
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "Formulir Pinjam",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5c5c5c),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: QTextField(
                    label: "Nama Lengkap",
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.fullName = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: QTextField(
                    label: "Email",
                    validator: Validator.email,
                    suffixIcon: Icons.email,
                    onChanged: (value) {
                      controller.email = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: QTextField(
                    label: "Password",
                    obscure: true,
                    validator: Validator.required,
                    suffixIcon: Icons.password,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: QDropdownField(
                    label: "Pinjam",
                    validator: Validator.required,
                    items: const [
                      {
                        "label": "Ruangan",
                        "value": "Ruangan",
                      },
                      {
                        "label": "Barang",
                        "value": "Barang",
                      }
                    ],
                    onChanged: (value, label) {
                      controller.loan = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: QDatePicker(
                    label: "Mulai Pinjam",
                    validator: Validator.required,
                    onChanged: (value) {
                      // print("value: $value");
                      controller.start = (value as DateTime?)!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: QDatePicker(
                    label: "Selesai Pinjam",
                    validator: Validator.required,
                    onChanged: (value) {
                      // print("value: $value");
                      controller.finish = (value as DateTime?)!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 42,
                      child: ElevatedButton.icon(
                          icon: const Icon(Icons.save),
                          label: const Text("Save"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () => controller.doSave()),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 42,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.cancel),
                        label: const Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          controller.formKey.currentState!.reset();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<SimlabView> createState() => SimlabController();
}
