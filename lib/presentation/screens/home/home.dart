import 'package:cooking_recipe/presentation/screens/home/widgets/search_line.dart';
import 'package:cooking_recipe/presentation/screens/widgets/recipe_card.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
