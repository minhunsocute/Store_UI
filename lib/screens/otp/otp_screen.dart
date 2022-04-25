import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Sign_up/widget/body_complete_profile.dart';
import 'package:flutter_application_1/screens/otp/widget/body.dart';

class otp_screen extends StatelessWidget {
  const otp_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body_Otp(),
    );
  }
}
