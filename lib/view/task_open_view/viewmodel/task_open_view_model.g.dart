// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_open_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskOpenViewModel on _TaskOpenViewModelBase, Store {
  late final _$taskAtom =
      Atom(name: '_TaskOpenViewModelBase.task', context: context);

  @override
  Task get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Task value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$taskCaseListAtom =
      Atom(name: '_TaskOpenViewModelBase.taskCaseList', context: context);

  @override
  ObservableList<dynamic> get taskCaseList {
    _$taskCaseListAtom.reportRead();
    return super.taskCaseList;
  }

  @override
  set taskCaseList(ObservableList<dynamic> value) {
    _$taskCaseListAtom.reportWrite(value, super.taskCaseList, () {
      super.taskCaseList = value;
    });
  }

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

  late final _$changeCircleAvatarColorAsyncAction = AsyncAction(
      '_TaskOpenViewModelBase.changeCircleAvatarColor',
      context: context);

  @override
  Future<void> changeCircleAvatarColor(int index) {
    return _$changeCircleAvatarColorAsyncAction
        .run(() => super.changeCircleAvatarColor(index));
  }

  late final _$_TaskOpenViewModelBaseActionController =
      ActionController(name: '_TaskOpenViewModelBase', context: context);

  @override
  void fullFillList() {
    final _$actionInfo = _$_TaskOpenViewModelBaseActionController.startAction(
        name: '_TaskOpenViewModelBase.fullFillList');
    try {
      return super.fullFillList();
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
task: ${task},
taskCaseList: ${taskCaseList},
value: ${value},
isLoading: ${isLoading}
    ''';
  }
}
