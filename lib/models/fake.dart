import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/models/promotions.dart';

class Fake {
  static int numberOfItemsInCart = 1;
  static List<Category> categories = [
    Category('assets/icons/chest.svg', 'Living Room'),
    Category('assets/icons/bathtub.svg', 'Bathroom'),
    Category('assets/icons/desk.svg', 'Workspace'),
  ];

  static List<Promotion> promotions = [
    Promotion(
      'All Item Furniture\nDiscount Up to',
      'assets/images/splash1.png',
      '',
      'assets/images/furniture/furniture1.png',
      false,
      '50%',
      '30 April 2019',
    ),
    Promotion(
      'Get voucher gift',
      'assets/images/splash2.png',
      '*for new member\'s\nof Furniture shop',
      '',
      true,
      '\$50.000',
      '',
    )
  ];
  static List<String> trending = [
    'assets/images/furniture/jacalyn-beales-435629-unsplash.png',
    'assets/images/furniture/sven-brandsma-1379481-unsplash.png',
  ];
  static List<String> freatured = [
    'assets/images/furniture/pexels-eric-montanah-1350789.jpg',
    'assets/images/furniture/pexels-patryk-kamenczak-775219.jpg',
    'assets/images/furniture/pexels-pixabay-276534.jpg',
    'assets/images/furniture/pexels-steve-johnson-923192.jpg',
  ];
  static List<Item> furniture = [
    Item(
      name: 'Chair Dacey li - Black',
      imagePath: 'assets/images/furniture/items/dacey.png',
      originalPrice: 80,
      rating: 4.5,
      discountPercent: 30,
    ),
    Item(
      name: 'Elly Sofa Patchwork',
      imagePath: 'assets/images/furniture/items/elly.png',
      originalPrice: 140,
      rating: 4.4,
      discountPercent: 30,
    ),
    Item(
      name: 'Dobson Table - White',
      imagePath: 'assets/images/furniture/items/table 2.png',
      originalPrice: 160,
      rating: 4.3,
      discountPercent: 25,
    ),
    Item(
      name: 'Nagano Table - Brown',
      imagePath: 'assets/images/furniture/items/ezgif.com-crop.png',
      originalPrice: 140,
      rating: 4.3,
      discountPercent: 20,
    ),
    Item(
      name: 'Chair Dacey li - White',
      imagePath: 'assets/images/furniture/items/CHair 2.png',
      originalPrice: 80,
      rating: 4.3,
      discountPercent: 20,
    ),
    Item(
      name: 'Chair Dacey li - Feather Grey',
      imagePath: 'assets/images/furniture/items/chair3.png',
      originalPrice: 80,
      rating: 4.0,
      discountPercent: 20,
    ),
  ];

  static List<dynamic> splashItem = [
    {
      "text": "Welcone to ToKoTo, Let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people connect with store \n  around United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shope \n  Just stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  static List<dynamic> categoris = [
    {
      "icon": "assets/icons/Flash Icon.svg",
      "text": "Flash Deal",
    },
    {
      "icon": "assets/icons/Bill Icon.svg",
      "text": "Bill",
    },
    {
      "icon": "assets/icons/Game Icon.svg",
      "text": "Game",
    },
    {
      "icon": "assets/icons/Gift Icon.svg",
      "text": "Daily Gift",
    },
    {
      "icon": "assets/icons/Discover.svg",
      "text": "More",
    },
  ];
}
