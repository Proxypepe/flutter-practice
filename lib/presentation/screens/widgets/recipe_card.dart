import 'package:cooking_recipe/presentation/screens/widgets/tag.dart';
import 'package:flutter/material.dart';

import '../../../data/remote/model/full_recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  final FullRecipe recipe;

  Widget getTags(List<String> tags) {
    return Column(children: tags.map((item) => Tag(tag: item)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        shadowColor: Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/image_placeholder.PNG',
                height: 100,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      child: Text(
                      'Name: ${recipe.name}',
                     overflow: TextOverflow.fade,
                      ),
                ),
                    Text('Prep: ${recipe.prepare}'),
                    Text('Cook: ${recipe.cook}'),
                    Text('Steps: ${recipe.steps}'),
                    Text('Ingredients: ${recipe.ingredients}'),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: getTags(recipe.tags!)
              )
            ],
          ),
        ));
  }
}
