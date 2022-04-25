// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class funiture_item extends StatelessWidget {
  final Item item;
  const funiture_item({
    Key? key,
    required this.item,
  }) : super(key: key);

  get onRatingUpdate => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset.zero,
            blurRadius: 15,
          ),
        ],
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 37),
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(item.imagePath),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${item.discountPercent}%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name),
              Wrap(
                spacing: 3,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('${Item.format(item.Price)}',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        height: 1.5,
                      )),
                  if (item.discountPercent != null)
                    Text(
                      '${Item.format(item.originalPrice)}',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black38,
                      ),
                    ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: item.rating,
                      minRating: 1,
                      itemSize: 12,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: Colors.amber[100],
                      itemBuilder: (contex, _) => Icon(
                        Icons.star,
                        size: 2,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) => print(rating),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${item.rating}',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
