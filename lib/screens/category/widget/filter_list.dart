import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category/widget/filter_list_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterList extends StatefulWidget {
  const FilterList({
    Key? key,
    required this.onSelected,
  }) : super(key: key);
  final Function(List<String>) onSelected;
  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  List<String> selected = [];
  List<dynamic> option = [
    {
      'icons': SvgPicture.asset('assets/icons/tag.svg'),
      'tittle': 'Discount',
    },
    {
      'icons': SvgPicture.asset('assets/icons/delivery.svg'),
      'tittle': 'Free Delivery',
    },
    {
      'icons': SvgPicture.asset('assets/icons/card.svg'),
      'tittle': 'Installment Plan',
    },
  ];
  reMoveOrAddtittle(tittle) {
    if (selected.contains(tittle)) {
      selected.remove(tittle);
    } else
      selected.add(tittle);
    setState(() {
      widget.onSelected(selected);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: option.map(
        (e) {
          return FilterListItem(
            icon: e['icons'],
            tittle: e['tittle'],
            selected: this.selected.contains(e['tittle']),
            onTap: () {
              reMoveOrAddtittle(e['tittle']);
            },
          );
        },
      ).toList(),
    );
  }
}
