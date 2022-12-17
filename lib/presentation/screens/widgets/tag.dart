import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.tag}) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: SizedBox(
                width: 50.0,
                child: Text(tag,
                overflow: TextOverflow.fade,
                    textAlign: TextAlign.center
                )
            ),
          ),
      ),
    );
  }
}
