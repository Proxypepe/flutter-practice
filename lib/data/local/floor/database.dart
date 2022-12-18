import 'dart:async';
import 'package:cooking_recipe/data/local/floor/recipe.dart';
import 'package:cooking_recipe/data/local/floor/recipe_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [RecipeEntity])
abstract class AppDatabase extends FloorDatabase {
  RecipeDao get recipeDao;
}