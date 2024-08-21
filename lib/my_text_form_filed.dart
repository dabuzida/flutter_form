import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({super.key});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final FocusNode _focusEmail = FocusNode();

  @override
  void initState() {
    super.initState();
    // _formKey.currentState!.validate();
    _controllerEmail.text =
        'It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted It is a long established fact that a reader will be distracted ';
    // 'It i';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      // width: 700,
      // height: 500,
      child: Column(
        children: <Widget>[
          // ElevatedButton(
          //   onPressed: () {
          //     _formKey.currentState!.validate();
          //   },
          //   child: const Text('@@@@@@@@'),
          // ),
          Container(
            width: 300,
            height: 240,
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Form(
              key: _formKey,
              child: TextFormField(
                // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))],
                controller: _controllerEmail,
                focusNode: _focusEmail,
                minLines: 4,
                maxLines: 4,
                // expands: true,
                decoration: InputDecoration(
                  isDense: true,
                  // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 46),
                  // hintText: hintText,
                  hintStyle: TextStyle(
                    // fontSize: context.responsiveRatioSize(phone: 12, tablet: 12),
                    color: Colors.grey.shade400,
                    fontFamily: 'Pretendard',
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.01,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        // color: focusedColor,
                        ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.01,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Colors.pink,
                      width: 1.01,
                    ),
                  ),
                  errorStyle: TextStyle(
                    // fontSize: context.responsiveRatioSize(phone: 10, tablet: 10),
                    color: Colors.pink,
                    fontFamily: 'Pretendard',
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      // color: focusedColor,
                      width: 1.01,
                    ),
                  ),
                ),
                validator: (String? value) {
                  return 'asdfsdfsd';
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
