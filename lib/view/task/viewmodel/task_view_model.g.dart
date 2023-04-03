// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskViewModel on _TaskViewModelBase, Store {
  late final _$titleControllerAtom =
      Atom(name: '_TaskViewModelBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$taskControllerAtom =
      Atom(name: '_TaskViewModelBase.taskController', context: context);

  @override
  TextEditingController get taskController {
    _$taskControllerAtom.reportRead();
    return super.taskController;
  }

  @override
  set taskController(TextEditingController value) {
    _$taskControllerAtom.reportWrite(value, super.taskController, () {
      super.taskController = value;
    });
  }

  late final _$listTileLengthAtom =
      Atom(name: '_TaskViewModelBase.listTileLength', context: context);

  @override
  int get listTileLength {
    _$listTileLengthAtom.reportRead();
    return super.listTileLength;
  }

  @override
  set listTileLength(int value) {
    _$listTileLengthAtom.reportWrite(value, super.listTileLength, () {
      super.listTileLength = value;
    });
  }

  late final _$checkboxValueAtom =
      Atom(name: '_TaskViewModelBase.checkboxValue', context: context);

  @override
  bool? get checkboxValue {
    _$checkboxValueAtom.reportRead();
    return super.checkboxValue;
  }

  @override
  set checkboxValue(bool? value) {
    _$checkboxValueAtom.reportWrite(value, super.checkboxValue, () {
      super.checkboxValue = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaskViewModelBase.isLoading', context: context);

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

  late final _$taskListAtom =
      Atom(name: '_TaskViewModelBase.taskList', context: context);

  @override
  List<String> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<String> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$checkboxValueListAtom =
      Atom(name: '_TaskViewModelBase.checkboxValueList', context: context);

  @override
  ObservableList<bool> get checkboxValueList {
    _$checkboxValueListAtom.reportRead();
    return super.checkboxValueList;
  }

  @override
  set checkboxValueList(ObservableList<bool> value) {
    _$checkboxValueListAtom.reportWrite(value, super.checkboxValueList, () {
      super.checkboxValueList = value;
    });
  }

  late final _$addTaskToListAsyncAction =
      AsyncAction('_TaskViewModelBase.addTaskToList', context: context);

  @override
  Future<void> addTaskToList() {
    return _$addTaskToListAsyncAction.run(() => super.addTaskToList());
  }

  late final _$_TaskViewModelBaseActionController =
      ActionController(name: '_TaskViewModelBase', context: context);

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask() {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.addTask');
    try {
      return super.addTask();
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCheckboxChanged(int index, bool value) {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.onCheckboxChanged');
    try {
      return super.onCheckboxChanged(index, value);
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkboxCase(int index) {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.checkboxCase');
    try {
      return super.checkboxCase(index);
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void returnHomePage() {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.returnHomePage');
    try {
      return super.returnHomePage();
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
taskController: ${taskController},
listTileLength: ${listTileLength},
checkboxValue: ${checkboxValue},
isLoading: ${isLoading},
taskList: ${taskList},
checkboxValueList: ${checkboxValueList}
    ''';
  }
}
