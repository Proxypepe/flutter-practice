import 'package:cooking_recipe/data/local/recipe_entity.dart';
import 'package:cooking_recipe/data/local/repository.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_event.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/get_fullrecipes.dart';

class RecipeBloc
    extends Bloc<RecipeEvent, RecipeState> {
  final GetFullRecipes _getFullRecipes;
  final Repository repository = Repository();


  RecipeBloc(this._getFullRecipes)
      : super(const RecipeInitialState()) {
    on<GetRecipeEvent>(_onFullRecipesFunc);
  }

  Future<void> _onFullRecipesFunc(
      GetRecipeEvent event,
      Emitter<RecipeState> emit,
      ) async {
    emit(const RecipeLoadingState());

    try {
      final result = await _getFullRecipes(
          const Params());

      // repository.insertRecipe(RecipeEntity(
      //     name: "name",
      //     description: "description",
      //     prepare: "prepare",
      //     cook: "cook",
      //     ingredients: 9,
      //     steps: 5,
      //     fileName: "some_file.png",
      //     tags: ["beef"]
      // ));
      final recipes = await repository.getRecipes();
      print(recipes[0].toString());

      emit(result.fold((l) => null,
              (r) => RecipeSuccessState(recipes: r))!);
    } on Exception catch(_) {
      emit(const RecipeErrorState(
          message: "something went very wrong :("));
    }
  }

}
