import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../data/remote/model/full_recipe.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<FullRecipe>>> getFullRecipes();
}
