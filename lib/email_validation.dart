import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailValidation extends StatefulWidget {
  const EmailValidation({super.key});

  @override
  State<EmailValidation> createState() => _EmailValidationState();
}

class _EmailValidationState extends State<EmailValidation> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerRegExp = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusRegExp = FocusNode();

  @override
  void initState() {
    super.initState();

    _xx();
  }

  Future<void> _xx() async {
    if (!mounted) {
      return;
    }
    Future<void>.delayed(
      const Duration(seconds: 2),
      () {
        _formKey.currentState!.validate();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          width: 700,
          height: 500,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  const Expanded(child: Text('이메일', textAlign: TextAlign.center)),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))],
                      controller: _controllerEmail,
                      focusNode: _focusEmail,
                      validator: (String? value) {
                        const String email = 'aw#waw@a.com';
                        // final String email = value ?? '';
                        // (@제외, 공백제외 모든문자)@(@제외, 공백제외 모든문자).[a-zA-Z]+

                        // final RegExp emailValidationRegExp = RegExp('.+[^@]');
                        final RegExp emailValidationRegExp = RegExp('[^#abc]+@[a-zA-Z0-9]+.[a-zA-Z]+');
                        // final RegExp emailValidationRegExp = RegExp('^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+.[a-zA-Z]+');

                        // final RegExp emailValidationRegExp = RegExp(r'.+[^@]@.+\.[a-zA-Z]+');
                        // final RegExp emailValidationRegExp = RegExp('[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+.[a-zA-Z]+');
                        // final RegExp emailValidationRegExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+');
                        final bool isEmailValid = emailValidationRegExp.hasMatch(email);
                        // final bool isEmailValid = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);
                        // xxx.xxx.xxx@xxx.xxx
                        // @전 주소의 구조는
                        // 시작: 알파벳
                        // 중간: 알파벳 숫자 . _ -
                        // 마지막: 알파벳 숫자

                        if (email.isEmpty) {
                          return 'Empty';
                        } else if (isEmailValid) {
                          return 'Valid';
                        } else {
                          return 'Invalid';
                        }
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          return;
                        }
                      },
                      child: const Text('테스트'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), //
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  const Expanded(child: Text('정규식', textAlign: TextAlign.center)),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _controllerRegExp,
                      focusNode: _focusRegExp,
                      validator: (String? value) {
                        const String myString = 'aA@--a#com';
                        // final String myString = value ?? '';
                        // final RegExp regExp = RegExp('c+');
                        print(r'aaa\naaa');
                        print('aaa\naaa');

                        final RegExp regExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
                        // final RegExp regExp = RegExp("^[a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+.[a-zA-Z]+");
                        // final RegExp regExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");

                        // final RegExp regExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+.[a-zA-Z]+");
                        // final RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        // final RegExp regExp = RegExp(r'^(side)[a-z]+(arm)$');
                        // final RegExp regExp = RegExp(r'^abc');
                        // final RegExp regExp = RegExp(r'\a\a\a'); // 맨앞의 r: raw. 의미는 \(backslash)의 escape기능을 무력화
                        // final RegExp regExp = RegExp('a\na'); // \가 escape기능을 함. /n말고도 여러 기능 존재
                        // final RegExp regExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]');
                        // final RegExp regExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+');
                        final bool isValid = regExp.hasMatch(myString);
                        // regExp.allMatches(input);
                        if (myString.isEmpty) {
                          return 'Empty';
                        } else if (isValid) {
                          return 'Valid';
                        } else {
                          return 'Invalid';
                        }
                        // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                        // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+"
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          return;
                        }
                      },
                      child: const Text('테스트'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
