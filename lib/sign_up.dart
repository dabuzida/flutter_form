import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerId = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: Text('아이디')),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _controllerId,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: '영문,숫자 조합 4자 이상'),
                    validator: (value) {
                      print('id input: $value');
                      if (value?.isEmpty ?? true) {
                        print('id validator fail');
                        return 'Please enter id';
                      }
                      print('id validator success');
                      return null; //
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: Text('비밀번호')),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _controllerPw,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: '영문,숫자특수문자 조합 8자이상 '),
                    validator: (value) {
                      print('id input: $value');
                      if (value?.isEmpty ?? true) {
                        print('id validator fail');
                        return 'Please enter id';
                      }
                      print('id validator success');
                      return null; //
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
