import 'package:equatable/equatable.dart';

import '../../../../data/remote/model/full_recipe.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object?> get props => [];
}

class RecipeInitialState extends RecipeState {
  const RecipeInitialState();
}

class RecipeLoadingState extends RecipeState {
  const RecipeLoadingState();
}

class RecipeSuccessState extends RecipeState {
  final List<FullRecipe> recipes;

  const RecipeSuccessState({required this.recipes});

  @override
  List<Object?> get props => [recipes];
}

class RecipeErrorState extends RecipeState {
  final String message;

  const RecipeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}