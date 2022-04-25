import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpaceBar extends StatelessWidget {
  const SpaceBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.075),
            offset: Offset(0.0, 1.0),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            hintText: 'Search unique furniture...',
            hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 14.0,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
