import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Formm2 extends StatefulWidget {
  const Formm2({Key? key}) : super(key: key);

  @override
  State<Formm2> createState() => _Formm2State();
}

class _Formm2State extends State<Formm2> {
  @override
  initState() {
    if (mounted) {
      print('mounted1');
    }
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      print('mounted2');
    }
    return Text('sd');
  }
}
