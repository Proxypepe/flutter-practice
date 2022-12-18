import 'package:cooking_recipe/data/local/pure/recipe_entity.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';


const String idTitle = "id";
const String nameTitle = "name";
const String descriptionTitle = "description";
const String prepareTitle = "prepare";
const String cookTitle = "cook";
const String ingredientsTitle = "ingredients";
const String stepsTitle = "steps";
const String fileNameTitle = "fileName";
const String tagTitle = "tags";


class DatabaseController {
  final dbClient = DBProvider.dbProvider;

  Future<RecipeEntity> create(RecipeEntity recipe) async {
    final Database db = await dbClient.db;
    db.insert(tableName, recipe.toMap());
    return recipe;
  }

  Future<List<RecipeEntity>> getRecipes() async {
    final db = await dbClient.db;
    List<Map> maps = await db.query(
        tableName,
        columns: [
          idTitle,
          nameTitle,
          descriptionTitle,
          prepareTitle,
          cookTitle,
          ingredientsTitle,
          stepsTitle,
          fileNameTitle,
          tagTitle,
        ]);
    if (maps.isNotEmpty) {
      List<RecipeEntity> result =  maps.map((e) => RecipeEntity.fromMap(e)).toList();
      return result;
    }
    return [];
  }


  Future<RecipeEntity?> getRecipe(int id) async {
    final db = await dbClient.db;

    List<Map> maps = await db.query(
        tableName,
        columns: [
          idTitle,
          nameTitle,
          descriptionTitle,
          prepareTitle,
          cookTitle,
          ingredientsTitle,
          stepsTitle,
          fileNameTitle,
          tagTitle,
        ],
        where: '$idTitle = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return RecipeEntity.fromMap(maps.first as Map<String, Object>);
    }

    return null;
  }

  Future<int> delete(int id) async {
    final db = await dbClient.db;
    return await db.delete(tableName, where: '$idTitle = ?', whereArgs: [id]);
  }

}