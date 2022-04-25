// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar_design(tittle: 'Profile'),
          SizedBox(height: 10),
          Stack(
            overflow: Overflow.visible,
            children: [
              SizedBox(
                height: 115,
                width: 115,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/Profile Image.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ProfileMenu(
            iconPath: 'assets/icons/User Icon.svg',
            tittle: 'My Account',
            press: () {},
          ),
          ProfileMenu(
            iconPath: 'assets/icons/Bell.svg',
            tittle: 'Notifications',
            press: () {},
          ),
          ProfileMenu(
            iconPath: 'assets/icons/Question mark.svg',
            tittle: 'Settings',
            press: () {},
          ),
          ProfileMenu(
            iconPath: 'assets/icons/Question mark.svg',
            tittle: 'Help Center',
            press: () {},
          ),
          ProfileMenu(
            iconPath: 'assets/icons/Log out.svg',
            tittle: 'Log out',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String iconPath;
  final String tittle;
  final Function() press;
  const ProfileMenu({
    Key? key,
    required this.iconPath,
    required this.tittle,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: FlatButton(
        color: Color.fromARGB(255, 232, 233, 238),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(30),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              color: primaryColor,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                tittle,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
