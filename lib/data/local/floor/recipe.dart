import 'package:floor/floor.dart';

@entity
class RecipeEntity {
  @primaryKey
  int id = 0;

  final String name;
  final String description;
  final String prepare;
  final String cook;
  final int ingredients;
  final int steps;
  final String fileName;
  final String tags;

  RecipeEntity(
      this.name,
      this.description,
      this.prepare,
      this.cook,
      this.ingredients,
      this.steps,
      this.fileName,
      this.tags
      );
}
