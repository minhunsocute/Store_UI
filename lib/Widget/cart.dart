// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_svg/svg.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key, required this.numberOfItemIncart}) : super(key: key);
  final int numberOfItemIncart;
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset('assets/icons/cart.svg'),
        ),
        if (numberOfItemIncart > 0)
          Positioned(
            right: -4.0,
            top: -4.0,
            child: Container(
              alignment: Alignment.center,
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.0),
              ),
              child: Text(
                '$numberOfItemIncart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
