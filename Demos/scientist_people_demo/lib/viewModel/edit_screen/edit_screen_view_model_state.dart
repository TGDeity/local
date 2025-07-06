import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:scientist_people_demo/Product/constatns.dart';
import 'package:scientist_people_demo/viewModel/edit_screen/edit_screen_view_model_mobx.dart';

abstract class EditScreenViewState<T extends StatefulWidget> extends State<T> {
  InputDecoration inputDecoration(String hintText) => InputDecoration(hintText: hintText);
  TextEditingController textControllerName = TextEditingController();
  TextEditingController textControllerImage = TextEditingController();
  TextEditingController textControllerQuote = TextEditingController();
  TextEditingController textControllerField = TextEditingController();
  TextEditingController textControllerBirthYear = TextEditingController();
 

  late Map<String, dynamic> pushedData;
  late final EditScreenViewModel viewModel;
  late final Map<String, dynamic> formDataModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<EditScreenViewModel>();
    pushedData = viewModel.formData;
    viewModel.updateFormData(pushedData);
    formDataModel = viewModel.getFormData();
    updateTextData(formDataModel);
  }

  void updateTextData(Map<String, dynamic> data) {
    textControllerName.text = data['name'] ?? '';
    textControllerImage.text = data[ScientistModeldataType.image.dataType] ?? '';
    textControllerQuote.text = data[ScientistModeldataType.quote.dataType] ?? '';
    textControllerField.text = data[ScientistModeldataType.field.dataType] ?? '';
    textControllerBirthYear.text = data[ScientistModeldataType.birthYear.dataType].toString();
  }

  @override
  void dispose() {
    super.dispose();
    textControllerName.dispose();
    textControllerImage.dispose();
    textControllerQuote.dispose();
    textControllerField.dispose();
    textControllerBirthYear.dispose();
  }

@computed
bool get isFormValid {
  return textControllerName.text.isNotEmpty &&
         textControllerImage.text.isNotEmpty &&
         textControllerQuote.text.isNotEmpty &&
         textControllerField.text.isNotEmpty &&
         textControllerBirthYear.text.isNotEmpty;
}


}
