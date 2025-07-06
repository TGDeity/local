// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListScreenViewModel on _ListScreenViewModelBase, Store {
  late final _$scientistListAtom = Atom(
    name: '_ListScreenViewModelBase.scientistList',
    context: context,
  );

  @override
  List<Map<String, dynamic>>? get scientistList {
    _$scientistListAtom.reportRead();
    return super.scientistList;
  }

  @override
  set scientistList(List<Map<String, dynamic>>? value) {
    _$scientistListAtom.reportWrite(value, super.scientistList, () {
      super.scientistList = value;
    });
  }

  late final _$getListScientistsAsyncAction = AsyncAction(
    '_ListScreenViewModelBase.getListScientists',
    context: context,
  );

  @override
  Future<void> getListScientists() {
    return _$getListScientistsAsyncAction.run(() => super.getListScientists());
  }

  late final _$deleteScientistAsyncAction = AsyncAction(
    '_ListScreenViewModelBase.deleteScientist',
    context: context,
  );

  @override
  Future<void> deleteScientist(int index) {
    return _$deleteScientistAsyncAction.run(() => super.deleteScientist(index));
  }

  @override
  String toString() {
    return '''
scientistList: ${scientistList}
    ''';
  }
}
