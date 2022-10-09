import 'package:cooking_recipe/data/local/database.dart';
import 'package:cooking_recipe/presentation/screens/home/widgets/search_line.dart';
import 'package:cooking_recipe/presentation/screens/widgets/recipe_card.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/local/model/recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  RecipeProvider db = RecipeProvider();

  @override
  void initState() {
    super.initState();
    db.insert(RecipeEntity(
      name: "fouth",
      description: "some description",
      prepare: "15 min",
      cook: "4 hs",
      ingredients: 2,
      steps: 3,
      fileName: "some file",
      tags: ["tag 1", "tag 2"]
    ));
    db.insert(RecipeEntity(
        name: "second",
        description: "some description",
        prepare: "15 min",
        cook: "4 hs",
        ingredients: 2,
        steps: 3,
        fileName: "some file",
        tags: ["tag 1", "tag 2"]
    ));
    db.insert(RecipeEntity(
        name: "third",
        description: "some description",
        prepare: "15 min",
        cook: "4 hs",
        ingredients: 2,
        steps: 3,
        fileName: "some file",
        tags: ["tag 1", "tag 2"]
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      const SearchLine(),
      Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const RecipeCard();
          },
          itemCount: 6,
        ),
      )
    ]);
  }
}
