import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerId = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();

// 리스트는 저장이 어떻게 되길래 final 추천이 뜨지
  final List<Map<String, String>> _listAccount = [];
  final List<String> _number = [];
  bool _obscure = true;
  Icon _icon = Icon(Icons.visibility);

  @override
  void initState() {
    super.initState();
    // _controllerId.text = 'money';
    _controllerPw.text = '1234qwer';
    _controllerNumber.text = '01055330022';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Expanded(child: Text('아이디')),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))],
                        controller: _controllerId,
                        decoration: const InputDecoration(hintText: '영문 시작, 숫자 가능, 4~20자'),
                        validator: (value) {
                          RegExp regExp = RegExp('^[a-z][a-z0-9]{3,20}');
                          if (value?.isEmpty ?? true) {
                            // 입력을 안했을때
                            return '아이디를 입력해 주세요';
                          } else if (regExp.hasMatch(value!)) {
                            // 통과시
                            return null; // 통과시 null 반환 >> validate()에서 종합할때, null을 성공으로 인식
                          } else {
                            // 그외 실패
                            return '영문 시작, 숫자 가능, 4~20자';
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Expanded(child: Text('비밀번호')),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9`~!@#\$%^&*()-_=+[\\]{}\\|;\':",./<>?]'))],
                        obscureText: _obscure,
                        controller: _controllerPw,
                        decoration: InputDecoration(
                          hintText: '영문, 숫자, 특수문자 가능, 8~20자',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (_obscure == true) {
                                _obscure = false;
                                _icon = Icon(Icons.visibility_off);
                              } else {
                                _obscure = true;
                                _icon = Icon(Icons.visibility);
                              }
                              setState(() {});
                            },
                            icon: _icon,
                          ),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp('[a-z0-9`~!@#\$%^&*()-_=+[\\]{}\\|;\':",./<>?]{8,20}');
                          if (value?.isEmpty ?? true) {
                            // 입력을 안했을때
                            return '비밀번호를 입력해 주세요';
                          } else if (regExp.hasMatch(value!)) {
                            // 통과시
                            return null; // 통과시 null 반환 >> validate()에서 종합할때, null을 성공으로 인식
                          } else {
                            // 그외 실패
                            return '영문, 숫자, 특수문자 가능, 8~20자';
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Expanded(child: Text('전화번호')),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        controller: _controllerNumber,
                        // decoration: const InputDecoration(hintText: ''),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            // 입력을 안했을때
                            return '전화번호를 입력해 주세요';
                          } else {
                            // 통과시
                            return null; // 통과시 null 반환 >> validate()에서 종합할때, null을 성공으로 인식
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('계정 생성 시도'),
                    onPressed: () {
                      print('pressed!');
                      if (_formKey.currentState!.validate()) {
                        _listAccount.add({_controllerId.text: _controllerPw.text});
                        _number.add(_controllerNumber.text);
                        setState(() {});
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text('생성된 계정'),
                Row(children: const <Widget>[
                  Expanded(child: Text('아이디')),
                  Expanded(flex: 2, child: Text('비밀번호')),
                  Expanded(flex: 2, child: Text('전화번호')),
                ]),
                for (int i = 0; i < _listAccount.length; i++)
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 1)),
                        color: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Text(_listAccount[_listAccount.length - i - 1].keys.first)),
                            Expanded(flex: 2, child: Text(_listAccount[_listAccount.length - i - 1].values.first)),
                            Expanded(flex: 2, child: Text(_number[_number.length - i - 1])),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
