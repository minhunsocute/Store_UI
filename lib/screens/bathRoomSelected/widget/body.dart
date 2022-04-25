// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/models/fake.dart';
import 'package:flutter_application_1/models/product2.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/details_screen/detailScreen.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/button_svg.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/categories.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/discount_banner.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/product_card.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/search_bar.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/sectiontittle.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/specialOfferdCard.dart';
import 'package:flutter_application_1/screens/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body_bathroom extends StatefulWidget {
  const Body_bathroom({Key? key}) : super(key: key);

  @override
  State<Body_bathroom> createState() => _Body_bathroomState();
}

class _Body_bathroomState extends State<Body_bathroom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Search_bar(size: size),
                  button_svg(
                    number: 0,
                    iconPath: 'assets/icons/Cart Icon.svg',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                  ),
                  button_svg(
                    number: 3,
                    iconPath: 'assets/icons/Bell.svg',
                    press: () {},
                  ),
                ],
              ),
            ),
            Discount_banner(),
            Categories(),
            SizedBox(height: 30),
            SectionTitle(tittle: "Special for you", press: () {}),
            SizedBox(height: 30),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialOfferdCard(
                    categories: "SmartPhone",
                    numberOfbrands: 18,
                    press: () {},
                    iconPath: 'assets/images/Image Banner 2.png',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SpecialOfferdCard(
                    categories: "Fashion",
                    numberOfbrands: 24,
                    press: () {},
                    iconPath: 'assets/images/Image Banner 3.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SectionTitle(tittle: 'Popular Product', press: () {}),
            SizedBox(height: 20),
            SingleChildScrollView(
              padding: const EdgeInsets.only(right: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    demoProduct_alls.length,
                    (index) => Product_card(
                      product: demoProduct_alls[index],
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              product: demoProduct_alls[index],
                            ),
                          ),
                        );
                      },
                      pressHeart: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
