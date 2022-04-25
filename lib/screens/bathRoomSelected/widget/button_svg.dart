// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class button_svg extends StatelessWidget {
  final int number;
  final String iconPath;
  final Function() press;
  const button_svg({
    Key? key,
    required this.number,
    required this.iconPath,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: press,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.1),
              ),
              child: SvgPicture.asset(iconPath),
            ),
            if (number != 0)
              Positioned(
                right: 0.0,
                top: -4.0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Text(
                    '$number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
