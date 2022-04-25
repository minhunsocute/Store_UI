import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Sign_up/widget/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body_signUp(),
    );
  }
}
