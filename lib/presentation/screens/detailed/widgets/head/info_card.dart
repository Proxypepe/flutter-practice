import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.prepare,
    required this.cooking,
  }) : super(key: key);

  final String prepare;
  final String cooking;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black
        )
      ),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text("Prepare: $prepare")
        ),
        Padding(
            padding: const EdgeInsets.all(5),
            child: Text("Cooking: $cooking")
        ),
      ]),
    );
  }
}
