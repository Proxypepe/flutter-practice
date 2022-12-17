import 'package:cooking_recipe/domain/usecase/get_fullrecipes.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/remote/model/repository/recipe_repository_impl.dart';
import '../data/remote/recipe_service.dart';
import '../domain/repository/recipe_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton(RecipeService());

  injector.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(injector()),
  );

  injector.registerSingleton<GetFullRecipes>(
      GetFullRecipes(injector()));

  injector.registerFactory<RecipeBloc>(
          () => RecipeBloc(injector()));
}
