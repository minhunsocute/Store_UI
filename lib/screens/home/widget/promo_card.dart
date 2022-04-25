import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

class PronoCard extends StatelessWidget {
  static final List<Color> bgColors = [primaryColor, secondaryPromoColor];
  final String tittle;
  final String subtittle;
  final String caption;
  final String tag;
  final String imagePath;
  final String backgroundImage;
  final bool reverseGradient;
  const PronoCard({
    Key? key,
    required this.tittle,
    required this.subtittle,
    required this.backgroundImage,
    this.caption = '',
    this.tag = '',
    this.imagePath = '',
    this.reverseGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset.zero,
            blurRadius: 15.0,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: reverseGradient != null && reverseGradient
              ? bgColors.reversed.toList()
              : bgColors,
        ),
        image: DecorationImage(
          image: AssetImage(this.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (this.imagePath != '')
            Positioned(
              top: 0,
              bottom: -15,
              left: 10,
              child: Container(
                child: Image.asset(this.imagePath),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 15,
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  this.tittle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                Text(
                  this.subtittle,
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 105,
            left: 20,
            child: (this.tag != '')
                ? Container(
                    margin: const EdgeInsets.only(top: 14),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      this.tag,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  )
                : Text(
                    this.caption,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
