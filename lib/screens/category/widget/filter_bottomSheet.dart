// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/screens/category/widget/color_list.dart';
import 'package:flutter_application_1/screens/category/widget/filter_list.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void close(context) {
      if (Navigator.canPop(context)) Navigator.pop(context);
    }

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            //built filter and reset
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      close(context);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  //color: Colors.black,
                  width: 90,
                  child: Text(
                    'Filter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Reset',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // built Price Range
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Price Range',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 13),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 22,
                  children: [
                    TextFieldNumber(
                      size: size,
                      tittle: 'Minimum',
                    ),
                    Container(
                      width: 20,
                      height: 1,
                      color: Colors.black26,
                    ),
                    TextFieldNumber(
                      size: size,
                      tittle: 'Maximum',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Item filters',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ),
            Container(
              child: FilterList(
                onSelected: (selected) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Item Colors',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ColorList(
                [
                  Colors.black,
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  primaryColor,
                ],
                onSelect: (color) => print(color),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(9),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  close(context);
                },
                color: primaryColor,
                textColor: Colors.white,
                child: Text(
                  'Apply text',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldNumber extends StatelessWidget {
  const TextFieldNumber({
    Key? key,
    required this.size,
    required this.tittle,
  }) : super(key: key);

  final Size size;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: ((size.width / 2) - 55),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextField(
        keyboardType:
            TextInputType.number, //Kiểu mà text field nhận vào là nummber
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ], // cái này là bắt buộc cho kiểu dữ liêu nhập vào là number
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: tittle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
