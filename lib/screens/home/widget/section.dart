import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home_page.dart';
import 'package:flutter_application_1/constants/color.dart';

class Section extends StatelessWidget {
  const Section({Key? key, required this.tittle, required this.children})
      : super(key: key);
  final String tittle;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // built header of Section
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tittle,
                style: TextStyle(
                  fontSize: 20.0,
                  height: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: primaryColor,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_forward,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(21),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.01),
                  offset: Offset.zero,
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 28,
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
