import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search_bar extends StatelessWidget {
  const Search_bar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        width: size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: kSecondaryColor.withOpacity(0.1),
        ),
        child: TextFormField(
          style: TextStyle(color: kTextColor),
          decoration: InputDecoration(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            border: InputBorder.none,
            hintText: 'Search Product',
            hintStyle: TextStyle(color: kTextColor),
          ),
        ),
      ),
    );
  }
}
