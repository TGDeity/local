import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:scientist_people_demo/viewModel/edit_screen/edit_screen_view_model_state.dart';

class EditScreenView extends StatefulWidget {
  const EditScreenView({super.key, this.pushedData});

  final Map<String, dynamic>? pushedData;

  @override
  State<EditScreenView> createState() => _EditScreenViewState();
}

class _EditScreenViewState extends EditScreenViewState<EditScreenView> {
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Screen')),
      body: Center(
        child: Observer(
          builder: (_) => Form(
            key: _formKey,
            child: Column(
              children: [
                Text(viewModel.formData.toString()),
                TextFormField(
                  validator: _validator,
                  controller: textControllerName,
                  decoration: inputDecoration('name'),
                ),
                TextFormField(
                  validator: _validator,
                  controller: textControllerImage,
                  decoration: inputDecoration('image'),
                ),
                TextFormField(
                  validator: _validator,
                  controller: textControllerQuote,
                  decoration: inputDecoration('quote'),
                ),
                TextFormField(
                  validator: _validator,
                  controller: textControllerField,
                  decoration: inputDecoration('field'),
                ),
                TextFormField(
                  validator: _validator,
                  controller: textControllerBirthYear,
                  decoration: inputDecoration('birthYear'),
                ),
                Observer(
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: () {
                        isFormValid
                            ? viewModel.updateScientistData(
                                textControllerName.text,
                                textControllerImage.text,
                                textControllerQuote.text,
                                textControllerField.text,
                                int.parse(textControllerBirthYear.text),
                              )
                            : null;

                        Navigator.pop(context, true);
                      },
                      child: Text('save'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
