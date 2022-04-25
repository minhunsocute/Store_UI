import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/all_cart.dart';
import 'package:flutter_application_1/models/product2.dart';
import 'package:flutter_application_1/screens/cart/widget/appbar.dart';
import 'package:flutter_svg/svg.dart';

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(demoCarts[0].id.toString()),
        background: Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.099),
          ),
          child: Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(Icons.delete, color: primaryColor),
              ),
            ],
          ),
        ),
        child: CartView(
          cart: demoCarts[index],
        ),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  final All_cart cart;
  const CartView({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 229, 231, 235),
                ),
                child: Image.asset(cart.product.images[0]),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: '\$${cart.product.price}',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'x${cart.numberOfItems}',
                      style: TextStyle(
                        color: kTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
