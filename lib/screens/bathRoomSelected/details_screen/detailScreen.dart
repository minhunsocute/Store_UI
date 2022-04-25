import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product2.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/details_screen/widget/body.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatelessWidget {
  final Product_all product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 231, 235),
      body: DetailBody(
        product: product,
      ),
    );
  }
}
