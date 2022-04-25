// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  final String tittle;
  final String iconPath;
  final Function() press;
  final bool active;
  const ActionButton({
    Key? key,
    required this.tittle,
    required this.iconPath,
    required this.press,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/' + iconPath,
            color: (active) ? primaryColor : Colors.black26,
          ),
          Stack(
            overflow: Overflow.visible,
            children: [
              Text(
                tittle,
                style: TextStyle(
                  color: (active) ? primaryColor : Colors.black26,
                  fontSize: 16,
                ),
              ),
              if (active)
                Positioned(
                  top: -3,
                  right: -12,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/tick.svg',
                      height: 5,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
