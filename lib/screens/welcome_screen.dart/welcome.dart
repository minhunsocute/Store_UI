import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart/widget/body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body_welcome(),
    );
  }
}
