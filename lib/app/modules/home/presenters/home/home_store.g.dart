// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$journalsAtom = Atom(name: 'HomeStoreBase.journals');

  @override
  List<Map<String, dynamic>> get journals {
    _$journalsAtom.reportRead();
    return super.journals;
  }

  @override
  set journals(List<Map<String, dynamic>> value) {
    _$journalsAtom.reportWrite(value, super.journals, () {
      super.journals = value;
    });
  }

  final _$titleAtom = Atom(name: 'HomeStoreBase.title');

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$describleAtom = Atom(name: 'HomeStoreBase.describle');

  @override
  String? get describle {
    _$describleAtom.reportRead();
    return super.describle;
  }

  @override
  set describle(String? value) {
    _$describleAtom.reportWrite(value, super.describle, () {
      super.describle = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescrible(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setDescrible');
    try {
      return super.setDescrible(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJournalsEntity(List<Map<String, dynamic>> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setJournalsEntity');
    try {
      return super.setJournalsEntity(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetData() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetData');
    try {
      return super.resetData();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
journals: ${journals},
title: ${title},
describle: ${describle}
    ''';
  }
}
