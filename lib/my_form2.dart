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
                buildUIRadioButton(title: 'title', checked: true),
                buildUIRadioButton(title: 'title', checked: true),
                buildUIRadioButton(title: 'title', checked: true),
                buildUIRadioButton(title: 'title', checked: true),
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

  Widget buildUIRadioButton({
    required String title,
    required bool checked,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IgnorePointer(
              child: Radio<bool>(
                fillColor: MaterialStateColor.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF00CBD2);
                    }

                    return const Color(0xFF959595);
                  },
                ),
                splashRadius: 0.0,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                groupValue: true,
                value: checked,
                onChanged: (bool? newValue) {},
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: checked ? const Color(0xFF00CBD2) : const Color(0xFF959595),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class MyForm2 extends StatefulWidget {
//   const MyForm2({Key? key}) : super(key: key);

//   @override
//   State<MyForm2> createState() => _MyForm2State();
// }

// class _MyForm2State extends State<MyForm2> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final ScrollController _scrollController = ScrollController();

//   final TextEditingController _controllerId = TextEditingController();

//   final List<Map<String, String>> _listAccount = [];
//   final List<String> _number = [];
//   bool _obscure = false;
//   final Icon _visibilityOn = const Icon(Icons.visibility); // 비밀번호 보이게
//   final Icon _visibilityOff = const Icon(Icons.visibility_off); // 비밀번호 점으로 표시
//   Icon? _icon;

//   @override
//   void initState() {
//     super.initState();
//     _controllerId.text = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       controller: _scrollController,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     const Expanded(child: Text('아이디')),
//                     Expanded(
//                       flex: 4,
//                       child: TextFormField(
//                         // initialValue: 'asdfsdfsdf',
//                         // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))],
//                         controller: _controllerId,
//                         validator: (value) {
//                           // RegExp regExp = RegExp('^[a-z][a-z0-9]{3,19}\$');
//                           final String email = value ?? '';

//                           // final bool emailValid = RegExp(r'^[a-c][d-f._-]+[x-z]$').hasMatch(email);
//                           final bool emailValid = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);

//                           if (email.isEmpty) {
//                             return '입력바람';
//                           } else if (emailValid) {
//                             return null;
//                           } else {
//                             return '형식을 맞추세요';
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     child: const Text('계정 생성 시도'),
//                     onPressed: () {
//                       print('>>> ${_controllerId.text}');
//                       print(_controllerId.text.length);
//                       print(_controllerId.text.runtimeType);
//                       print('pressed!');
//                       if (_formKey.currentState!.validate()) {
//                         setState(() {});
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text('생성된 계정'),
//                 Row(children: const <Widget>[
//                   Expanded(child: Text('아이디')),
//                   Expanded(flex: 2, child: Text('비밀번호')),
//                   Expanded(flex: 2, child: Text('전화번호')),
//                 ]),
//                 for (int i = 0; i < _listAccount.length; i++)
//                   Column(
//                     children: [
//                       const SizedBox(height: 5),
//                       Container(
//                         // decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 1)),
//                         color: Colors.grey[300],
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Row(
//                           children: <Widget>[
//                             Expanded(child: Text(_listAccount[_listAccount.length - i - 1].keys.first)),
//                             Expanded(flex: 2, child: Text(_listAccount[_listAccount.length - i - 1].values.first)),
//                             Expanded(flex: 2, child: Text(_number[_number.length - i - 1])),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                     ],
//                   )
//               ],
//             ),
//           ),
//         ),
//       ],
// >>>>>>> ec1070bd7df475aaba9a39980c9f081c3cbd353b
//     );
//   }
// }