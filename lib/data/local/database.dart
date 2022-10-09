import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'model/recipe.dart';

const String tableName = "recipes";


const String idTitle = "id";
const String nameTitle = "name";
const String descriptionTitle = "description";
const String prepareTitle = "prepare";
const String cookTitle = "cook";
const String ingredientsTitle = "ingredients";
const String stepsTitle = "steps";
const String fileNameTitle = "fileName";
const String tagTitle = "tags";


class RecipeProvider {

  late Database _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = "${dir}recipe.db";

    var database = await openDatabase(
        path,
      version: 1,
      onCreate: (db, version) {
          db.execute('''
          create table $tableName ( 
          $idTitle integer primary key autoincrement, 
          $nameTitle text not null,
          $descriptionTitle text not null,
          $prepareTitle text not null,
          $cookTitle text not null,
          $ingredientsTitle integer not null,
          $stepsTitle integer not null,
          $fileNameTitle text not null,
          $tagTitle text not null,
          )
          ''');
      },
    );
    return database;
  }

  Future<RecipeEntity> insert(RecipeEntity recipe) async {
    _database.insert(tableName, recipe.toMap());
    return recipe;
  }

  Future<RecipeEntity?> getRecipes(int id) async {
    List<Map> maps = await _database.query(
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
    return await _database.delete(tableName, where: '$idTitle = ?', whereArgs: [id]);
  }

  Future close() async => _database.close();

}