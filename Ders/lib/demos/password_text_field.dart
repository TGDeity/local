import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureTextChar = "*";
  bool _isScure = true;

  void _changeLoading() {
    setState(() {
      _isScure = !_isScure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isScure,
      obscuringCharacter: _obscureTextChar,
      controller: widget.controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'pass',

        suffix: _onVisibilityIcon(),
        //prefix: Icon(Icons.lock),
        //suffixIcon: Icon(Icons.abc)
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: () {
        _changeLoading();
      },
      icon: AnimatedCrossFade(
        firstChild: Text('|\n|', style: TextStyle(color: Colors.red)),
        secondChild: Text('-__-', style: TextStyle(color: Colors.green)),
        crossFadeState: _isScure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
