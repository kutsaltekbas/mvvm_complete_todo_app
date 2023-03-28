// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardViewModel on _OnBoardViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_OnBoardViewModelBase.isLoading', context: context);

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

  late final _$_OnBoardViewModelBaseActionController =
      ActionController(name: '_OnBoardViewModelBase', context: context);

  @override
  void facebookLogin() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.facebookLogin');
    try {
      return super.facebookLogin();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void googleLogin() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.googleLogin');
    try {
      return super.googleLogin();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emailLogin() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.emailLogin');
    try {
      return super.emailLogin();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
