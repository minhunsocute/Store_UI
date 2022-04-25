import 'package:flutter/material.dart';

class SpecialOfferdCard extends StatelessWidget {
  final String categories;
  final int numberOfbrands;
  final Function() press;
  final String iconPath;

  const SpecialOfferdCard({
    Key? key,
    required this.categories,
    required this.numberOfbrands,
    required this.press,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 242,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                iconPath,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
                child: RichText(
                  text: TextSpan(
                    text: "${categories}\n",
                    style: TextStyle(fontSize: 20),
                    children: [
                      TextSpan(
                        text: "${numberOfbrands} Brands",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
