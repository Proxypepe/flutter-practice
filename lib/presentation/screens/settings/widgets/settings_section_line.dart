import 'package:flutter/material.dart';

class SettingsSectionLine extends StatelessWidget {
  const SettingsSectionLine({
    Key? key,
    required this.button,
    required this.optionName,
    required this.info,
  }) : super(key: key);

  final Widget button;
  final String optionName;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  optionName,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: button,
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 100,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(info),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
