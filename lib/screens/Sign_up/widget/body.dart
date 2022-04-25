import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/Widget/socal_card.dart';
import 'package:flutter_application_1/screens/Sign_up/widget/sign_up_main.dart';

class Body_signUp extends StatefulWidget {
  const Body_signUp({Key? key}) : super(key: key);

  @override
  State<Body_signUp> createState() => _Body_signUpState();
}

class _Body_signUpState extends State<Body_signUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              AppBar_design(tittle: 'Sign Up'),
              SizedBox(height: 20),
              Text(
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "Mui",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(height: 20),
              FormSignUp(),
              SizedBox(height: 110),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Socal_card(
                    icon_path: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  Socal_card(
                    icon_path: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  Socal_card(
                    icon_path: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'By continuing your confirm that you agree\nwith our Term and Condition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
