import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    Key? key,

  }) : super(key: key);


  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
        ),
        child: Center (
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                      child: Text("$counter"),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        if (counter != 1) {
                          counter--;
                        }
                      });
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
