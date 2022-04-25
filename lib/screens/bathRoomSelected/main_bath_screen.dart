import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bottom_navigation.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/body.dart';

class bathRoomMain extends StatelessWidget {
  const bathRoomMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBottomNavigation(),
      body: Body_bathroom(),
    );
  }
}
