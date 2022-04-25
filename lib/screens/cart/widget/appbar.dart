import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/all_cart.dart';

class Appbar_d extends StatelessWidget {
  const Appbar_d({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              SizedBox(width: size.width / 2 * 1.6),
              Text(
                '${demoCarts.length} items',
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
