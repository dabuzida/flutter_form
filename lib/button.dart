import 'package:flutter/material.dart';

typedef FuncType = int Function({required String name, required int age})?;

// typedef ValidatorCallback = String? Function(String? text);

class Button extends StatefulWidget {
  Button({
    required this.x,
    required this.callback,
    Key? key,
  }) : super(key: key);
  int x;
  FuncType callback;
  FuncType callback1;
  FuncType callback2;
  FuncType callback3;
  FuncType callback4;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(result.toString()),
          TextButton(
            onPressed: () {
              result = widget.callback?.call(name: 'sss', age: 145) ?? 0;

              setState(() {});
            },
            child: Text('BTN'),
          ),
        ],
      ),
    );
  }
}
