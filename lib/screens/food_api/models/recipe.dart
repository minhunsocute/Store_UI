import 'dart:convert';
import 'package:flutter_application_1/screens/food_api/models/recipe.api.dart';
import 'package:http/http.dart' as http;

class RecipApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "24", "start": "0"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "X-RapidAPI-Key": "6d711d975dmsh6aad55054dc59b4p1a2c30jsncfaa0840ec47",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
