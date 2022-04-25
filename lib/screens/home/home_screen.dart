import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bottom_navigation.dart';
import 'package:flutter_application_1/models/fake.dart';
import 'package:flutter_application_1/screens/bathRoomSelected/main_bath_screen.dart';
import 'package:flutter_application_1/screens/category/category_screen.dart';
import 'package:flutter_application_1/screens/food_api/foodScreen.dart';
import 'package:flutter_application_1/screens/home/widget/category_card.dart';
import 'package:flutter_application_1/screens/home/widget/header.dart';
import 'package:flutter_application_1/screens/home/widget/image_card.dart';
import 'package:flutter_application_1/screens/home/widget/promo_card.dart';
import 'package:flutter_application_1/screens/home/widget/section.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({Key? key}) : super(key: key);

  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  @override
  Widget build(BuildContext context) {
    onCategorySelected(Category) {
      switch (Category.tittle) {
        case 'Living Room':
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(),
              ),
            );
          }
          break;
        case 'Bathroom':
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => bathRoomMain(),
              ),
            );
          }
          break;
        case 'Workspace':
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodScreen(),
              ),
            );
          }
      }
    }

    return Scaffold(
      bottomNavigationBar: appBottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Section(
                tittle: 'Categoris',
                children: Fake.categories.map(
                  (c) {
                    return CategoryCard(
                      tittle: c.tittle,
                      iconPath: c.iconPath,
                      onTap: () {
                        onCategorySelected(c);
                      },
                    );
                  },
                ).toList(),
              ),
              Section(
                tittle: 'Today\'s Promo',
                children: Fake.promotions.map((c) {
                  return PronoCard(
                    tittle: c.tittle,
                    backgroundImage: c.backgroundImage,
                    reverseGradient: c.reverseGradient,
                    tag: c.tag,
                    caption: c.caption,
                    subtittle: c.subtittle,
                    imagePath: c.imagePath,
                  );
                }).toList(),
              ),
              Section(
                  tittle: 'Trendding Furniture',
                  children: Fake.trending.map((c) {
                    return ImageCard(
                      imagePath: c,
                    );
                  }).toList()),
              Section(
                tittle: 'Featured Furniture',
                children: Fake.freatured.map(
                  (c) {
                    return ImageCard(imagePath: c);
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
