import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../../data/remote/model/full_recipe.dart';
import '../repository/recipe_repository.dart';

class GetFullRecipes implements UseCase<FullRecipe, Params> {
  final RecipeRepository repository;

  GetFullRecipes(this.repository);

  @override
  Future<Either<Failure, List<FullRecipe>>> call(Params params) async {
    return await repository.getFullRecipes();
  }
}

class Params extends Equatable {

  const Params();

  @override
  List<Object?> get props => [];
}
