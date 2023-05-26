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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 400),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              const Expanded(flex: 2, child: SizedBox()),
              const Text('이메일'),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: TextFormField(
                  // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))],
                  controller: _controllerEmail,
                  focusNode: _focusEmail,
                  decoration: const InputDecoration(hintText: '이메일을 입력해주세요.'),
                  validator: (String? value) {
                    // RegExp regExp = RegExp('^[a-z][a-z0-9]{3,19}\$');
                    // if (value?.isEmpty ?? true) {
                    //   // 입력을 안했을때
                    //   return '아이디를 입력해 주세요';
                    // } else if (regExp.hasMatch(value!)) {
                    //   // 통과시
                    //   return null;
                    // } else {
                    //   // 그외 실패
                    //   return '영문 시작, 숫자 가능, 4~20자';
                    // }

                    final String email = value ?? '';
                    final RegExp emailValidationRegExp = RegExp('[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+.[a-zA-Z]+');
                    // final RegExp emailValidationRegExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+');
                    final bool isEmailValid = emailValidationRegExp.hasMatch(email);
                    // final bool isEmailValid = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);
                    // xxx.xxx.xxx@xxx.xxx
                    // @전 주소의 구조는
                    // 시작: 알파벳
                    // 중간: 알파벳 숫자 . _ -
                    // 마지막: 알파벳 숫자

                    if (email.isEmpty) {
                      return '이메일을 입력해주세요.';
                    } else if (isEmailValid) {
                      return '유효한 이메일입니다.';
                      // return null;
                    } else {
                      return '올바른 형식의 이메일을 입력하세요.';
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
                  child: const Text('이메일 검증'),
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              const Expanded(flex: 2, child: SizedBox()),
              const Text('정규식 테스트'),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: _controllerRegExp,
                  focusNode: _focusRegExp,
                  validator: (String? value) {
                    final String myString = value ?? '';
                    final RegExp regExp = RegExp(r'^(side)[a-z]+(arm)$');
                    // final RegExp regExp = RegExp(r'^abc');
                    // final RegExp regExp = RegExp(r'\a\a\a'); // 맨앞의 r: raw. 의미는 \(backslash)의 escape기능을 무력화
                    // final RegExp regExp = RegExp('a\na'); // \가 escape기능을 함. /n말고도 여러 기능 존재
                    // final RegExp regExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]');
                    // final RegExp regExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+');
                    final bool isValid = regExp.hasMatch(myString);

                    if (myString.isEmpty) {
                      return 'empty';
                    } else if (isValid) {
                      return 'valid';
                    } else {
                      return 'not valid';
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
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
