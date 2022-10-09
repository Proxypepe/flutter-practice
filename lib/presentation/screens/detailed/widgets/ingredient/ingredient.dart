import 'package:flutter/material.dart';

class IngredientLine extends StatefulWidget {
  const IngredientLine({
    Key? key,
    required this.ingredientName
  }) : super(key: key);

  final String ingredientName;

  @override
  State<IngredientLine> createState() => _IngredientLineState();
}

class _IngredientLineState extends State<IngredientLine> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.red;
    }

    return Card(
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(
                widget.ingredientName
            ),
          ],
        )
    );
  }
}
