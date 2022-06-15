import 'package:flutter/material.dart';

class TextFormFieldd extends StatefulWidget {
  const TextFormFieldd({Key? key}) : super(key: key);

  @override
  State<TextFormFieldd> createState() => _TextFormFielddState();
}

class _TextFormFielddState extends State<TextFormFieldd> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
      decoration: const InputDecoration(
      icon: Icon(Icons.person),
      hintText: 'What do people call you?',
      labelText: 'Name *',
      ),
      onSaved: (String? value) {
      // This optional block of code can be used to run
      // code when the user saves the form.
      },
      validator: (String? value) {
      return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
      },
    ),
    );
  }
}
