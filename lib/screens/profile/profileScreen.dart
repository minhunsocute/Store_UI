import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bottom_navigation.dart';
import 'package:flutter_application_1/screens/profile/widget/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBottomNavigation(),
      body: BodyProfile(),
    );
  }
}
