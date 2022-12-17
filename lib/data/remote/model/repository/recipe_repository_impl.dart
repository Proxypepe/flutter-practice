import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../domain/repository/recipe_repository.dart';
import '../../recipe_service.dart';
import '../full_recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeService _recipeService;

  RecipeRepositoryImpl(this._recipeService);

  @override
  Future<Either<Failure, List<FullRecipe>>> getFullRecipes() async {
    return Right(await _recipeService.getRecipes());
  }
}