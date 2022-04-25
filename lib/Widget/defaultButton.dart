import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/screens/sign_in/sign_in_screen.dart';

class DefaultButton extends StatelessWidget {
  final String tittle;
  final Function() press;
  const DefaultButton({
    Key? key,
    required this.tittle,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 1),
        //width: size.width - 100,
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset.zero,
              blurRadius: 15,
            ),
          ],
        ),
        child: Text(
          tittle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
