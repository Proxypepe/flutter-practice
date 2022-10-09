import 'package:cooking_recipe/presentation/screens/detailed/widgets/head/head.dart';
import 'package:cooking_recipe/presentation/screens/detailed/widgets/ingredient/ingredients.dart';
import 'package:cooking_recipe/presentation/screens/detailed/widgets/step/steps.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Detailed Screen"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              children: const <Widget>[
                HeadSection(
                  prepare: '15 min',
                  cooking: '4 hs',
                  description: 'some description',
                ),
                IngredientsSection(),
                StepsSection(),
              ]
          ),
      )
    );
  }
}
