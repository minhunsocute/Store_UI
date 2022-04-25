import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/screens/Sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/screens/forgetPass/forget_pass_screen.dart';
import 'package:flutter_application_1/screens/forgetPass/widget/forget_main.dart';

class Body_forget extends StatefulWidget {
  const Body_forget({Key? key}) : super(key: key);

  @override
  State<Body_forget> createState() => _Body_forgetState();
}

class _Body_forgetState extends State<Body_forget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            AppBar_design(tittle: 'Forgot Password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: "Mui",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Please enter your email and we will send \nyou a link to return to yours account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(height: 80),
                  FormForgetPass(),
                  SizedBox(height: 80),
                  DontHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row DontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
