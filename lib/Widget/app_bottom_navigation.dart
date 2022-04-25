import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home_page.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/profile/profileScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class appBottomNavigation extends StatefulWidget {
  const appBottomNavigation({Key? key}) : super(key: key);

  @override
  State<appBottomNavigation> createState() => _appBottomNavigationState();
}

class _appBottomNavigationState extends State<appBottomNavigation> {
  int _selectedIndex = 0;
  int _index_page = 0;
  @override
  Widget build(BuildContext context) {
    List<dynamic> appBottomItems = [
      {
        'icon': 'assets/icons/home.svg',
        'label': 'Home',
        'check': true,
        'index': 0,
      },
      {
        'icon': 'assets/icons/box.svg',
        'label': 'Delivery',
        'check': false,
        'index': 1,
      },
      {
        'icon': 'assets/icons/chat.svg',
        'label': 'Messages',
        'check': false,
        'index': 2,
      },
      {
        'icon': 'assets/icons/wallet.svg',
        'label': 'Wallet',
        'check': false,
        'index': 3,
      },
      {
        'icon': 'assets/icons/profile.svg',
        'label': 'Profile',
        'check': false,
        'index': 4,
      },
    ];

    void onItemTapped(int index) {
      setState(
        () {
          print(appBottomItems);
          _selectedIndex = index;
          switch (_selectedIndex) {
            case 0:
              {
                setState(() {
                  _index_page = 0;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
              break;
            case 4:
              {
                {
                  if (_index_page != 4)
                    setState(() {
                      _index_page = 4;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    });
                  _selectedIndex = 0;
                  ;
                }
              }
              break;
          }
        },
      );
    }

    return BottomNavigationBar(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      items: appBottomItems.map((e) {
        return BottomNavigationBarItem(
          icon: SvgPicture.asset(e['icon']),
          label: e['label'],
          activeIcon: SvgPicture.asset(e['icon'],
              color:
                  _selectedIndex == e['index'] ? primaryColor : Colors.black),
        );
      }).toList(),
      onTap: onItemTapped,
    );
  }
}
