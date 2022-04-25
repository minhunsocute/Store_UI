import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/Widget/defaultButton.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar_design(tittle: 'Login Success'),
            SizedBox(height: 30),
            Image.asset(
              'assets/images/success.png',
              color: primaryColor,
              height: size.height / 4 * 2,
            ),
            SizedBox(height: 28),
            Text(
              "Login Success",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 56),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: DefaultButton(
                  tittle: 'Continue',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreenn(),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
