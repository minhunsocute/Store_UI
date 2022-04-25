// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/defaultButton.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/models/fake.dart';
import 'package:flutter_application_1/screens/Sign_up/confirm_profile_screen.dart';
import 'package:flutter_application_1/screens/Sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/otp/otp_screen.dart';
import 'package:flutter_application_1/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/screens/sign_in/widget/sign_in_main.dart';

class Body_welcome extends StatefulWidget {
  const Body_welcome({Key? key}) : super(key: key);

  @override
  State<Body_welcome> createState() => _Body_welcomeState();
}

class _Body_welcomeState extends State<Body_welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                itemCount: Fake.splashItem.length,
                itemBuilder: (context, index) {
                  return SplashbackgroundItem(
                    tittle: Fake.splashItem[index]['text'],
                    imagePath: Fake.splashItem[index]['image'],
                    index: index,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width - 320),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      DefaultButton(
                        tittle: 'Continue',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SplashbackgroundItem extends StatelessWidget {
  final String imagePath;
  final String tittle;
  final int index;
  const SplashbackgroundItem({
    Key? key,
    required this.imagePath,
    required this.tittle,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: 36,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(tittle),
        Spacer(
          flex: 4,
        ),
        Image.asset(
          imagePath,
          height: 265,
          width: 235,
        ),
        Spacer(
          flex: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (indexdots) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 8,
              width: index == indexdots ? 25 : 8,
              decoration: BoxDecoration(
                color: indexdots == index
                    ? primaryColor
                    : primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
