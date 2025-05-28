import 'package:ders/product/language/language_Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFiledLearn extends StatefulWidget {
  const TextFiledLearn({super.key});

  @override
  State<TextFiledLearn> createState() => _TextFiledLearnState();
}

class _TextFiledLearnState extends State<TextFiledLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            focusNode: focusNodeTextFieldOne,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [TextProjextInputFormtter()._formatter],
            textInputAction: TextInputAction.next,
            //autofocus: true,

            buildCounter: (context, {required currentLength, required isFocused, required maxLength}) =>
                AnimatedContainer(
                  key: key,
                  duration: const Duration(seconds: 10),
                  child: Container(
                    height: 10,
                    width: currentLength * 10,
                    color: Colors.green /*[100 * ((currentLength) ~/ 2)]*/,
                  ),
                ),
            maxLength: 20,
            decoration: _inputDecoration(LanguageItems.name),
          ),
          TextField(focusNode: focusNodeTextFieldTwo,textInputAction: TextInputAction.done,decoration: _inputDecoration(LanguageItems.mail),)
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String labelText) => InputDecoration(border: OutlineInputBorder(), labelText: labelText);
}

class TextProjextInputFormtter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    }
    return newValue;
  });
}
