import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final String tittle;
  final String iconPath;
  final Function() onTap;
  const CategoryCard({
    Key? key,
    required this.tittle,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                height: 42,
                width: 42,
                child: SvgPicture.asset(this.iconPath, color: primaryColor),
              ),
              Text(
                this.tittle,
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
