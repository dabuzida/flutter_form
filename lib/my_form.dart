import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _controllerId = TextEditingController();

  final List<Map<String, String>> _listAccount = [];
  final List<String> _number = [];
  bool _obscure = false;
  final Icon _visibilityOn = const Icon(Icons.visibility); // 비밀번호 보이게
  final Icon _visibilityOff = const Icon(Icons.visibility_off); // 비밀번호 점으로 표시
  Icon? _icon;

  @override
  void initState() {
    super.initState();
    _controllerId.text = 'money';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
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
                        // initialValue: 'asdfsdfsdf',
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))],
                        controller: _controllerId,
                        decoration: const InputDecoration(hintText: '영문 시작, 숫자 가능, 4~20자'),
                        validator: (value) {
                          RegExp regExp = RegExp('^[a-z][a-z0-9]{3,19}\$');
                          if (value?.isEmpty ?? true) {
                            // 입력을 안했을때
                            return '아이디를 입력해 주세요';
                          } else if (regExp.hasMatch(value!)) {
                            // 통과시
                            return null;
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
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('계정 생성 시도'),
                    onPressed: () {
                      print(_formKey);
                      print(_formKey.currentState);
                      print(_formKey.currentState!.validate());
                      if (_formKey.currentState!.validate()) {
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
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('계정 생성 시도'),
            onPressed: () {
              print(_formKey);
              print(_formKey.currentState);
              print(_formKey.currentState!.validate());
              if (_formKey.currentState!.validate()) {
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
