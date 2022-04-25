import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

class Discount_banner extends StatelessWidget {
  const Discount_banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: primaryPromoColor,
        image: DecorationImage(
          image: AssetImage('assets/images/splash2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: RichText(
        text: TextSpan(
          text: 'A Summer Surprise\n',
          children: [
            TextSpan(
              text: 'Cashback 20%',
              style: TextStyle(
                fontSize: 25,
                height: 1.5,
                fontFamily: "Mui",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
