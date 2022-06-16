import 'package:flutter/material.dart';

class Formm extends StatefulWidget {
  const Formm({Key? key}) : super(key: key);

  @override
  State<Formm> createState() => _FormmState();
}

class _FormmState extends State<Formm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerId = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();

  bool _switch = true;
  int? y;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.orange[900],
                    child: TextButton(
                      onPressed: () {},
                      child: Text('A'),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.green[300],
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          int? x;
                          if (_switch) {
                            x = 20;
                          }
                          y = x ?? 16;
                          print('x:$x, y:$y');
                        });
                      },
                      child: Text('B'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('>> ${y.toString()} <<'),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text('현재 bool: ${_switch.toString()}'),
                  const SizedBox(width: 50),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.purple[300],
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _switch = !_switch;
                        });
                      },
                      child: const Text('Swich'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(border: Border.all(color: Colors.red[900]!)),
                    width: 200,
                    child: TextFormField(
                      controller: _controllerId, // currentNode: _focusId,
                      // keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'input your id',
                        // enabledBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // contentPadding: EdgeInsets.symmetric(
                        //   horizontal: widget.horizontalPadding,
                        //   vertical: _getVerticalPadding(), //widget.verticalPadding,
                        // ),
                        // isDense: true,
                        // hintStyle: TextStyle(
                        //   height: widget.textHeight ?? Preset.primaryTextHeight,
                        //   fontFamily: Preset.primaryFontFamily,
                        //   fontSize: _getFontSize(),
                        //   color: Preset.colorPlaceholderFont,
                        // ),
                        // errorStyle: const TextStyle(
                        //   height: 1000000,
                        //   color: Colors.pink,
                        //   decoration: TextDecoration.none,
                        //   fontSize: kIsWeb ? -1000000 : 0,
                        // ),
                        // errorBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // disabledBorder: InputBorder.none,
                      ),
                      validator: (value) {
                        print('id input: $value');
                        if (value?.isEmpty ?? true) {
                          print('id validator fail');
                          return 'Please enter id';
                        } // if (value == null || value.isEmpty) {}
                        print('id validator success');
                        return null; //
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
                    width: 200,
                    child: TextFormField(
                      controller: _controllerPw, // currentNode: _focusId,
                      decoration: InputDecoration(
                        hintText: 'input your password',
                      ),
                      validator: (value) {
                        print('pw input: $value');
                        if (value?.isEmpty ?? true) {
                          print('pw validator fail');
                          return 'Please enter password';
                        }
                        print('pw validator success');
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // final String inputedEmail = _controllerId.text;
                    final String inputedEmail = _controllerId.text.trim();
                    final String inputedPassword = _controllerPw.text.trim();
                    if (_formKey.currentState!.validate()) {
                      print('Form is valid. Wait for server response');
                      print('>>> $inputedEmail, $inputedPassword');

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    } else {
                      print('Form is invalid. Check your id or password');
                      print('>>> $inputedEmail, $inputedPassword');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
