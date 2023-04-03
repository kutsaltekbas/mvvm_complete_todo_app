// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_open_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskOpenViewModel on _TaskOpenViewModelBase, Store {
  late final _$valueAtom =
      Atom(name: '_TaskOpenViewModelBase.value', context: context);

  @override
  bool get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(bool value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaskOpenViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_TaskOpenViewModelBaseActionController =
      ActionController(name: '_TaskOpenViewModelBase', context: context);

  @override
  void changeCircleAvatarColor() {
    final _$actionInfo = _$_TaskOpenViewModelBaseActionController.startAction(
        name: '_TaskOpenViewModelBase.changeCircleAvatarColor');
    try {
      return super.changeCircleAvatarColor();
    } finally {
      _$_TaskOpenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_TaskOpenViewModelBaseActionController.startAction(
        name: '_TaskOpenViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_TaskOpenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
isLoading: ${isLoading}
    ''';
  }
}
