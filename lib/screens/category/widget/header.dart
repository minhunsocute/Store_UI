// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Widget/cart.dart';
import 'package:flutter_application_1/screens/category/widget/filter_bottomSheet.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/fake.dart';
import 'actionn_button.dart';

class HeaderCate extends StatelessWidget {
  const HeaderCate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0.0, 10.0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader1(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  iconPath: 'controls.svg',
                  tittle: 'Filter',
                  press: () {
                    _settingModalBottomSheet(context);
                  },
                  active: true,
                ),
                VerticalSep(),
                ActionButton(
                  iconPath: 'sort.svg',
                  tittle: 'Sort',
                  press: () {},
                ),
                VerticalSep(),
                ActionButton(
                  iconPath: 'list.svg',
                  tittle: 'List',
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (BuildContext bc) {
      return FilterBottomSheet();
    },
  );
}

class VerticalSep extends StatelessWidget {
  const VerticalSep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: 1,
      height: 20,
    );
  }
}

class buildHeader1 extends StatelessWidget {
  const buildHeader1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: SvgPicture.asset('assets/icons/back.svg'),
            ),
          ),
          //Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Living Room',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          //Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            width: 70,
            alignment: Alignment.centerRight,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4.0,
              children: [
                Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      height: 18,
                    ),
                  ),
                ),
                Cart(numberOfItemIncart: Fake.numberOfItemsInCart)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
