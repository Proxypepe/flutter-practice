import 'dart:convert';
import 'package:cooking_recipe/data/remote/model/full_recipe.dart';
import 'package:http/http.dart' as http;
import 'package:cooking_recipe/data/remote/model/recipe.dart';

class RecipeApi {
  static const String port = '';
  static const String baseUrl = 'http://localhost:$port';
  static const String endpoint = '/';

  List<Recipe> parseRecipes(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
  }

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse("$baseUrl/$endpoint"));
    if (response.statusCode == 200) {
      return parseRecipes(response.body);
    }
    throw Exception('Failed to load recipes');
  }

  Future<FullRecipe> fetchFullRecipe(String name) async {
    final response = await http.get(Uri.parse("$baseUrl/$endpoint/$name"));
    if (response.statusCode == 200) {
      return FullRecipe.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load recipes');
  }
}
