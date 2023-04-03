// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenViewModel on _SplashScreenViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SplashScreenViewModelBase.isLoading', context: context);

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

  late final _$navigatorAtom =
      Atom(name: '_SplashScreenViewModelBase.navigator', context: context);

  @override
  NavigationService get navigator {
    _$navigatorAtom.reportRead();
    return super.navigator;
  }

  @override
  set navigator(NavigationService value) {
    _$navigatorAtom.reportWrite(value, super.navigator, () {
      super.navigator = value;
    });
  }

  late final _$_SplashScreenViewModelBaseActionController =
      ActionController(name: '_SplashScreenViewModelBase', context: context);

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_SplashScreenViewModelBaseActionController
        .startAction(name: '_SplashScreenViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_SplashScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
navigator: ${navigator}
    ''';
  }
}
