import 'package:cooking_recipe/data/local/floor/database.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_event.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/get_fullrecipes.dart';

class RecipeBloc
    extends Bloc<RecipeEvent, RecipeState> {
  final GetFullRecipes _getFullRecipes;
  // final Repository repository = Repository();


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
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      final recipeDao = database.recipeDao;
      final result = await _getFullRecipes(
          const Params());
      // recipeDao.insertRecipe(
      //     RecipeEntity(
      //         "name",
      //         "description",
      //         "prepare",
      //         "cook",
      //         9,
      //         5,
      //         "fileName",
      //         ""
      //     )
      // );
      final recipes = await recipeDao.findAllRecipes();

      print(recipes);

      emit(result.fold((l) => null,
              (r) => RecipeSuccessState(recipes: r))!);
    } on Exception catch(_) {
      emit(const RecipeErrorState(
          message: "something went very wrong :("));
    }
  }

}
