// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_screen_view_model_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditScreenViewModel on _EditScreenViewModelBase, Store {
  late final _$formDataAtom = Atom(
    name: '_EditScreenViewModelBase.formData',
    context: context,
  );

  @override
  Map<String, dynamic> get formData {
    _$formDataAtom.reportRead();
    return super.formData;
  }

  @override
  set formData(Map<String, dynamic> value) {
    _$formDataAtom.reportWrite(value, super.formData, () {
      super.formData = value;
    });
  }

  late final _$_EditScreenViewModelBaseActionController = ActionController(
    name: '_EditScreenViewModelBase',
    context: context,
  );

  @override
  void updateFormData(Map<String, dynamic> data) {
    final _$actionInfo = _$_EditScreenViewModelBaseActionController.startAction(
      name: '_EditScreenViewModelBase.updateFormData',
    );
    try {
      return super.updateFormData(data);
    } finally {
      _$_EditScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, dynamic> getFormData() {
    final _$actionInfo = _$_EditScreenViewModelBaseActionController.startAction(
      name: '_EditScreenViewModelBase.getFormData',
    );
    try {
      return super.getFormData();
    } finally {
      _$_EditScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateScientistData(
    String name,
    String image,
    String quote,
    String field,
    int birthYear,
  ) {
    final _$actionInfo = _$_EditScreenViewModelBaseActionController.startAction(
      name: '_EditScreenViewModelBase.updateScientistData',
    );
    try {
      return super.updateScientistData(name, image, quote, field, birthYear);
    } finally {
      _$_EditScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formData: ${formData}
    ''';
  }
}
