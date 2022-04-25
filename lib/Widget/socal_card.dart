import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Socal_card extends StatelessWidget {
  final String icon_path;
  final Function() press;
  const Socal_card({
    Key? key,
    required this.icon_path,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 227, 228, 233),
        ),
        child: SvgPicture.asset(
          icon_path,
          height: 20,
        ),
      ),
    );
  }
}
