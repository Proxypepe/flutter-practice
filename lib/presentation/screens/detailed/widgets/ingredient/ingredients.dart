import 'package:flutter/material.dart';

import 'button.dart';
import 'ingredient.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
                "Ingredients",
                style: TextStyle(fontWeight: FontWeight.bold)
            )
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const CounterButton(),
                TextButton(
                  onPressed: () {  },
                  child: const Text("Adjust"),
                )
              ],
            ),
          ),
          const IngredientLine(
            ingredientName: "Ingredient name",
          ),
      ]
      )
    );
  }
}
