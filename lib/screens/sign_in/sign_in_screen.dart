import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/sign_in/widget/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body_signIn(),
    );
  }
}
