import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/screens/Sign_up/widget/confirm_main.dart';

class Body_confirm extends StatefulWidget {
  const Body_confirm({Key? key}) : super(key: key);

  @override
  State<Body_confirm> createState() => _Body_confirmState();
}

class _Body_confirmState extends State<Body_confirm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              AppBar_design(tittle: 'Sign Up'),
              Text(
                'Complete Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Mui",
                ),
              ),
              Text(
                'Complete your details or continue \nwith social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Confirm_main(),
              SizedBox(
                height: 30,
              ),
              Text(
                'By continuing your confirm that you agree\nwith out Term and Condition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
