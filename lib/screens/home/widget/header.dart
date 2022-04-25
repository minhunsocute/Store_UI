import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/cart.dart';
import 'package:flutter_application_1/models/fake.dart';
import 'package:flutter_application_1/screens/home/widget/search_bar.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Furniture Shope",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Cart(numberOfItemIncart: Fake.numberOfItemsInCart),
            ],
          ),
          Text(
            'Get Unique furniture for your home',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black38,
              height: 2,
            ),
          ),
          SpaceBar(),
        ],
      ),
    );
  }
}
