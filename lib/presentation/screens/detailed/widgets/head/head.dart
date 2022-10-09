import 'package:flutter/material.dart';

import 'info_card.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({
    Key? key,
    required this.prepare,
    required this.cooking,
    required this.description,
  }) : super(key: key);

  final String prepare;
  final String cooking;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget> [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    InfoCard(
                      prepare: prepare,
                      cooking: cooking,
                    ),
                    Image.asset(
                      'assets/image_placeholder.PNG',
                      height: 200,
                      width: 200,
                    ),
                  ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child:Text(description)
            )
          ]
        )
    );
  }
}
