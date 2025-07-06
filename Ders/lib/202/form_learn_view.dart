import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode
            .always, //Formun validatorunu otomatik olarak cagırır ve hata mesajı verir. bu özellik açıkken onChange ile validate etmeye gerek yok gibi
        child: Column(
          children: [
            TextFormField(validator: FormFiledValidator().isNotEmpty),
            TextFormField(validator: FormFiledValidator().isNotEmpty),
            DropdownButtonFormField<String>(
              validator: FormFiledValidator().isNotEmpty,
              //value: 'ZA',
              items: [
                DropdownMenuItem(value: '1T',child: Text('1'),),
                DropdownMenuItem(value: '2T',child: Text('2'),),
              ],
              onChanged: (e) {},
            ),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState?.validate();
              },
              child: Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFiledValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmptyMessage;
  }
}

class ValidatorMessage {
  static const String _notEmptyMessage = 'Bos gecilemez';
}
