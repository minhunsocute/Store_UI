import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product2.dart';

class All_cart {
  final Product_all product;
  final int numberOfItems;
  All_cart({
    required this.product,
    required this.numberOfItems,
  });

  get id => null;
}

List<All_cart> demoCarts = [
  All_cart(product: demoProduct_alls[0], numberOfItems: 2),
  All_cart(product: demoProduct_alls[1], numberOfItems: 1),
  All_cart(product: demoProduct_alls[2], numberOfItems: 4),
  All_cart(product: demoProduct_alls[3], numberOfItems: 3),
];
