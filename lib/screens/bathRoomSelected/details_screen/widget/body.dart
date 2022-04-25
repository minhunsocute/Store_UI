import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/defaultButton.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/product2.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/widget/button_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailBody extends StatefulWidget {
  final Product_all product;
  const DetailBody({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  int selectedImage = 0;
  int selectedColor = 0;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(
            width: 238,
            child: AspectRatio(
              child: Image.asset(widget.product.images[selectedImage]),
              aspectRatio: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.product.images.length,
                (index) {
                  return SmallPreview(index);
                },
              )
            ],
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(widget.product.title,
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 64,
                    decoration: BoxDecoration(
                      color: widget.product.isFavourite
                          ? Color(0xFFFFE6E6)
                          : Color.fromARGB(255, 247, 248, 250),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: widget.product.isFavourite
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 64,
                  ),
                  child: Text(
                    widget.product.description,
                    maxLines: 3,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'See more Detail',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                TopRoundedContainer(
                  color: Color.fromARGB(255, 229, 231, 235),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            ...List.generate(
                              widget.product.colors.length,
                              (index) {
                                return ColorDot(
                                  widget: widget,
                                  color: widget.product.colors[index],
                                  isSelected: index == selectedColor,
                                  press: () {
                                    setState(() {
                                      selectedColor = index;
                                    });
                                  },
                                );
                              },
                            ),
                            Spacer(),
                            RoundedButton(
                                icon: Icon(Icons.remove), press: () {}),
                            SizedBox(width: 10),
                            RoundedButton(icon: Icon(Icons.add), press: () {}),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:
                            DefaultButton(tittle: " Add to Cart", press: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector SmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: selectedImage == index ? primaryColor : Colors.white,
          ),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Icon icon;
  final Function() press;
  const RoundedButton({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: press,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function() press;
  const ColorDot({
    Key? key,
    required this.widget,
    required this.color,
    required this.isSelected,
    required this.press,
  }) : super(key: key);

  final DetailBody widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? primaryColor : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const TopRoundedContainer({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(
                  '4,5',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                SvgPicture.asset('assets/icons/Star Icon.svg')
              ],
            ),
          ),
        )
      ],
    );
  }
}
