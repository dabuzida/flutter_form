import 'package:flutter/material.dart';

class MyForm2 extends StatelessWidget {
  MyForm2({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerId = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  final FocusNode _focusId = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final FocusNode _focusPhone = FocusNode();
  final FocusNode _focusButton = FocusNode();

  @override
  Widget build(BuildContext context) {
    // print(_formKey);
    // print(_formKey.currentState);
    // print(_formKey.currentState?.validate());
    // print(_formKey.currentState!.validate());
    return Container(
      // color: Colors.grey,
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: 400,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: TextFormField(
                    controller: _controllerId,
                    focusNode: _focusPhone,
                    autofocus: true,
                  ),
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: TextFormField(
                    controller: _controllerPassword,
                    // focusNode: _focusPassword,
                    focusNode: _focusButton,
                  ),
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: TextFormField(
                    controller: _controllerPhone,
                    // focusNode: _focusPhone,
                    focusNode: _focusPassword,
                  ),
                ),
                ElevatedButton(
                  focusNode: _focusId,
                  child: const Text('계정 생성 시도'),
                  onPressed: () {},
                ),
              ],
            ),
            // ElevatedButton(
            //   child: const Text('계정 생성 시도'),
            //   autofocus: false,
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
