import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

class ColorList extends StatefulWidget {
  final List<Color> colors;
  final Function(Color) onSelect;
  const ColorList(
    this.colors, {
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  @override
  Widget build(BuildContext context) {
    Color selected = Colors.white;
    select(color) {
      selected = color;
      setState(
        () {
          widget.onSelect(selected);
        },
      );
    }

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(7),
        child: Wrap(
          spacing: 20,
          children: widget.colors.map(
            (e) {
              return InkWell(
                onTap: () {
                  select(e);
                  print(selected);
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: selected == e
                        ? Border.all(
                            width: 2,
                            color: primaryColor,
                          )
                        : Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                    color: e,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset.zero,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
