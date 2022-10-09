import 'package:flutter/material.dart';

class StepLine extends StatefulWidget {
  const StepLine({
    Key? key,
    required this.stepDescription,
    required this.stepNumber,
  }) : super(key: key);

  final String stepDescription;
  final int stepNumber;

  @override
  State<StepLine> createState() => _StepLineState();
}

class _StepLineState extends State<StepLine> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                children: <Widget>[
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
                      "Step ${widget.stepNumber}",
                      style: const TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
              child: Text(widget.stepDescription),
            )
          ]
      ),
    );
  }
}
