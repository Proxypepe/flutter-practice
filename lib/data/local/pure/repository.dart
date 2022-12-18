import 'package:cooking_recipe/data/local/pure/recipe_entity.dart';
import 'database_controller.dart';

class Repository{
  final dbController = DatabaseController();
  Future getRecipe(int id) => dbController.getRecipe(id);
  Future<List<RecipeEntity>> getRecipes() => dbController.getRecipes();

  Future<RecipeEntity> insertRecipe(RecipeEntity recipe) async => dbController.create(recipe);
}