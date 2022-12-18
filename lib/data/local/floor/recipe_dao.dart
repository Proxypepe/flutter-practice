import 'package:cooking_recipe/data/local/floor/recipe.dart';
import 'package:floor/floor.dart';

@dao
abstract class RecipeDao {
  @Query('SELECT * FROM RecipeEntity')
  Future<List<RecipeEntity>> findAllRecipes();

  @Query('SELECT * FROM RecipeEntity WHERE id = :id')
  Stream<RecipeEntity?> findRecipeById(int id);

  @insert
  Future<void> insertRecipe(RecipeEntity recipe);
}