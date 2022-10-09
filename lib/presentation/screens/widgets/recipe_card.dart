import 'package:cooking_recipe/presentation/screens/widgets/tag.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
  }) : super(key: key);

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
                  children: const <Widget>[
                    Text('Name: '),
                    Text('Prep: '),
                    Text('Cook: '),
                    Text('Steps: '),
                    Text('Ingredients: '),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(children: const <Widget>[
                    Tag(tag: "Beef"),
                    Tag(tag: "Fire"),
                  ]))
            ],
          ),
        )
    );
  }
}
