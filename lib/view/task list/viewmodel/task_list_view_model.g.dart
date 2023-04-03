// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListViewModel on _TaskListViewModelBase, Store {
  late final _$dataListAtom =
      Atom(name: '_TaskListViewModelBase.dataList', context: context);

  @override
  List<Task> get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(List<Task> value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  late final _$listviewlengthAtom =
      Atom(name: '_TaskListViewModelBase.listviewlength', context: context);

  @override
  int get listviewlength {
    _$listviewlengthAtom.reportRead();
    return super.listviewlength;
  }

  @override
  set listviewlength(int value) {
    _$listviewlengthAtom.reportWrite(value, super.listviewlength, () {
      super.listviewlength = value;
    });
  }

  late final _$dataLengthAtom =
      Atom(name: '_TaskListViewModelBase.dataLength', context: context);

  @override
  int get dataLength {
    _$dataLengthAtom.reportRead();
    return super.dataLength;
  }

  @override
  set dataLength(int value) {
    _$dataLengthAtom.reportWrite(value, super.dataLength, () {
      super.dataLength = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaskListViewModelBase.isLoading', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_TaskListViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_TaskListViewModelBaseActionController =
      ActionController(name: '_TaskListViewModelBase', context: context);

  @override
  void openTask() {
    final _$actionInfo = _$_TaskListViewModelBaseActionController.startAction(
        name: '_TaskListViewModelBase.openTask');
    try {
      return super.openTask();
    } finally {
      _$_TaskListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_TaskListViewModelBaseActionController.startAction(
        name: '_TaskListViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_TaskListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataList: ${dataList},
listviewlength: ${listviewlength},
dataLength: ${dataLength},
isLoading: ${isLoading}
    ''';
  }
}
