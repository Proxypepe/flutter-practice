import 'package:cooking_recipe/data/remote/model/full_recipe.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_event.dart';
import 'package:cooking_recipe/presentation/screens/home/widgets/search_line.dart';
import 'package:cooking_recipe/presentation/screens/widgets/recipe_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/recipe_bloc.dart';
import 'bloc/recipe_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RecipeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<RecipeBloc>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Recipes"),
          actions: [
            IconButton(onPressed: () => bloc.add(const GetRecipeEvent()), icon: const Icon(Icons.refresh)),
          ],
        ),
        body: _buildBody());
  }
  Widget _buildBody() {
    final appTheme = Theme.of(context);

    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RecipeErrorState) {
          return Center(
              child: Text(
                  state.message,
                  style: appTheme.textTheme.titleLarge?.copyWith(color: appTheme.colorScheme.primary)
              )
          );
        }
        if (state is RecipeSuccessState) {
          return _buildHomeScreen(state.recipes);
        }
        return Center(
          child: ElevatedButton(
            child: const Text("Fetch Data"),
            onPressed: () {
              bloc.add(const GetRecipeEvent());
            },
          ),
        );
      },
    );
  }

  @override
  Widget _buildHomeScreen(List<FullRecipe> recipes) {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      const SearchLine(),
      Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RecipeCard(recipe: recipes[index]);
          },
          itemCount: recipes.length,
        ),
      )
    ]);
  }
}
