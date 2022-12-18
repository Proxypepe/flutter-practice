import 'dart:io';
import 'dart:async';

import 'package:cooking_recipe/data/local/pure/recipe_entity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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

class DBProvider {
  DBProvider._();

  static final DBProvider dbProvider = DBProvider._();

  Database? _database;

  Future<Database> get db async {
    if (_database != null) {
      Database _db = _database!;
      return _db;
    }
    _database = await initDB();
    Database _db = _database!;
    return _db;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('''
          create table $tableName ( 
          $idTitle integer primary key autoincrement, 
          $nameTitle text not null,
          $descriptionTitle text not null,
          $prepareTitle text not null,
          $cookTitle text not null,
          $ingredientsTitle integer not null,
          $stepsTitle integer not null,
          $fileNameTitle text not null,
          $tagTitle text not null
          )
          ''');
        });
  }
  Future<RecipeEntity> insert(RecipeEntity recipe) async {
    _database?.insert(tableName, recipe.toMap());
    return recipe;
  }

  Future<RecipeEntity?> getRecipe(int id) async {
    List<Map> maps = await _database!.query(
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

  Future<int?> delete(int id) async {
    return await _database?.delete(tableName, where: '$idTitle = ?', whereArgs: [id]);
  }

  Future close() async => _database?.close();
}

