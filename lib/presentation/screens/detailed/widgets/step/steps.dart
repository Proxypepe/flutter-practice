import 'package:cooking_recipe/presentation/screens/detailed/widgets/step/step.dart';
import 'package:flutter/material.dart';

class StepsSection extends StatelessWidget {
  const StepsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card (
      child: Column(
          children: const <Widget>[
            Text(
                "Steps",
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
            StepLine(
              stepDescription: "First step description",
              stepNumber: 1,
            ),
          ]
      )
    );
  }
}
