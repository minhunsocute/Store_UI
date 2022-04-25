import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

class SectionTitle extends StatelessWidget {
  final String tittle;
  final Function() press;
  const SectionTitle({
    Key? key,
    required this.tittle,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tittle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              'See more',
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
