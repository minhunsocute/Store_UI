import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

class FilterListItem extends StatelessWidget {
  const FilterListItem({
    Key? key,
    required this.icon,
    required this.tittle,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  final Widget icon;
  final String tittle;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tittle,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check,
                color: primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
