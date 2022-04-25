import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bottom_navigation.dart';
import 'package:flutter_application_1/models/fake.dart';
import 'package:flutter_application_1/screens/category/widget/funictureGrid.dart';
import 'package:flutter_application_1/screens/category/widget/header_silver.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBottomNavigation(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HeaderSilver(
                minExtent: 120,
                maxExtent: 120,
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: Fake.furniture.map(
                (e) {
                  return funiture_item(
                    item: e,
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
