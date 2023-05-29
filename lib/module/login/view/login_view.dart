import 'package:flutter/material.dart';
import 'package:tes_2/core.dart';
import '../controller/login_controller.dart';
import '../widget/button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Color(0xffe6fbe3),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              "assets/images/logo.png",
              width: 200.0,
              height: 200.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          // subtitle
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Simlab",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff5c5c5c),
              ),
            ),
          ),
          // subtitle
          Text(
            "Sistem Manajemen Lab",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff5c5c5c)),
          ),
          const SizedBox(
            height: 78.0,
          ),
          ButtonIntro(),
        ],
      )),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
