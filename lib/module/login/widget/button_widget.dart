import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

class ButtonIntro extends StatelessWidget {
  const ButtonIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController introController =
        LoginController(); // membuat instance dari IntroController
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff2a9235),
            ),
            onPressed: () => introController
                .doIntro(), // menggunakan instance dari IntroController
            child: Text(
              "Start Now",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
