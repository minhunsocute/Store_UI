import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/food_api/models/recipe.api.dart';
import 'package:flutter_application_1/screens/food_api/models/recipe.dart';
import 'package:flutter_application_1/screens/food_api/widget/recipe_card.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text(
              'Food Recipe',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body:
          _isLoading ? Center(child: CircularProgressIndicator()) : Container(),
    );
  }
}
