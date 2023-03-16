import 'package:flutter/material.dart';
import 'package:flutter_form/button.dart';
import 'package:flutter_form/sign_up.dart';

import 'formm.dart';
import 'formm2.dart';
import 'formm3.dart';
import 'my_form.dart';
import 'my_form2.dart';
import 'text_form_fieldd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        // backgroundColor: Colors.greenAccent[100],
        // body: Button(
        //     x: 180,
        //     callback: ({required String name, required int age}) {
        //       print('clicked callback');
        //       print(name);
        //       print(age);
        //       return 11;
        //     }),
        // body: const MyForm(),
        body: MyForm2(),
        // body: const SignUp(),
        // body: const Formm(),
        // body: const Formm2(),
        // body: const Formm3(),
        // body: const TextFormFieldd(),
      ),
    );
  }
}
