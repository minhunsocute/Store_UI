import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/product2.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product_card extends StatelessWidget {
  final Product_all product;
  final Function() pressHeart;
  final Function() press;
  const Product_card({
    Key? key,
    required this.product,
    required this.press,
    required this.pressHeart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSecondaryColor.withOpacity(0.1),
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
              (product.title.length > 20)
                  ? Text(
                      product.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    )
                  : Text(
                      '${product.title}\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: pressHeart,
                    child: Container(
                      width: 28,
                      height: 28,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/Heart Icon_2.svg',
                        color: product.isFavourite
                            ? Color(0xFFFF4848)
                            : Colors.black12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
