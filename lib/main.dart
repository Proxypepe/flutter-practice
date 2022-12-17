import 'package:cooking_recipe/presentation/injector.dart';
import 'package:cooking_recipe/presentation/navigation/app_navigation.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_bloc.dart';
import 'package:cooking_recipe/presentation/screens/home/bloc/recipe_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/theme/app_theme.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//           useMaterial3: true
//       ),
//       home: const AppNavigation()
//     );
//   }
// }

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeBloc>(
      create: (_) => injector()..add(const GetRecipeEvent()),
      child: MaterialApp(
        title: 'Startup Name Generator',
        // theme: theme.copyWith(textTheme: appTextTheme),
        theme: AppTheme.light,
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const HomeScreen(),
        //   '/settings': (context) => const SettingsScreen()
        // },
        home: const AppNavigation()
      ),
    );
  }
}