import 'package:cooking_recipe/presentation/screens/settings/widgets/settings_section_line.dart';
import 'package:cooking_recipe/presentation/screens/settings/widgets/switch_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SettingsSectionLine(
          button: ElevatedButton(
            onPressed: () {},
            child: const Text('Clean'),
          ),
          optionName: "Clean app cache",
          info: "Cleaning app cache"),
      const SettingsSectionLine(
          button: SwitchButton(isLight: true),
          optionName: "Change theme",
          info: "Changing the theme")
    ]);
  }
}
