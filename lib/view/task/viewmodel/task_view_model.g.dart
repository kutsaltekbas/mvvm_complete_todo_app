// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskViewModel on _TaskViewModelBase, Store {
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

  late final _$postTaskControllerAtom =
      Atom(name: '_TaskViewModelBase.postTaskController', context: context);

  @override
  TextEditingController get postTaskController {
    _$postTaskControllerAtom.reportRead();
    return super.postTaskController;
  }

  @override
  set postTaskController(TextEditingController value) {
    _$postTaskControllerAtom.reportWrite(value, super.postTaskController, () {
      super.postTaskController = value;
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

  late final _$taskDataAtom =
      Atom(name: '_TaskViewModelBase.taskData', context: context);

  @override
  Map<String, dynamic> get taskData {
    _$taskDataAtom.reportRead();
    return super.taskData;
  }

  @override
  set taskData(Map<String, dynamic> value) {
    _$taskDataAtom.reportWrite(value, super.taskData, () {
      super.taskData = value;
    });
  }

  late final _$taskListLengthAtom =
      Atom(name: '_TaskViewModelBase.taskListLength', context: context);

  @override
  int get taskListLength {
    _$taskListLengthAtom.reportRead();
    return super.taskListLength;
  }

  @override
  set taskListLength(int value) {
    _$taskListLengthAtom.reportWrite(value, super.taskListLength, () {
      super.taskListLength = value;
    });
  }

  late final _$taskCategoryAtom =
      Atom(name: '_TaskViewModelBase.taskCategory', context: context);

  @override
  String get taskCategory {
    _$taskCategoryAtom.reportRead();
    return super.taskCategory;
  }

  @override
  set taskCategory(String value) {
    _$taskCategoryAtom.reportWrite(value, super.taskCategory, () {
      super.taskCategory = value;
    });
  }

  late final _$taskDescriptionAtom =
      Atom(name: '_TaskViewModelBase.taskDescription', context: context);

  @override
  String get taskDescription {
    _$taskDescriptionAtom.reportRead();
    return super.taskDescription;
  }

  @override
  set taskDescription(String value) {
    _$taskDescriptionAtom.reportWrite(value, super.taskDescription, () {
      super.taskDescription = value;
    });
  }

  late final _$taskTitleAtom =
      Atom(name: '_TaskViewModelBase.taskTitle', context: context);

  @override
  String get taskTitle {
    _$taskTitleAtom.reportRead();
    return super.taskTitle;
  }

  @override
  set taskTitle(String value) {
    _$taskTitleAtom.reportWrite(value, super.taskTitle, () {
      super.taskTitle = value;
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

  late final _$taskCaseListAtom =
      Atom(name: '_TaskViewModelBase.taskCaseList', context: context);

  @override
  List<bool> get taskCaseList {
    _$taskCaseListAtom.reportRead();
    return super.taskCaseList;
  }

  @override
  set taskCaseList(List<bool> value) {
    _$taskCaseListAtom.reportWrite(value, super.taskCaseList, () {
      super.taskCaseList = value;
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

  late final _$getTaskListLengthAsyncAction =
      AsyncAction('_TaskViewModelBase.getTaskListLength', context: context);

  @override
  Future<void> getTaskListLength() {
    return _$getTaskListLengthAsyncAction.run(() => super.getTaskListLength());
  }

  late final _$postDataAsyncAction =
      AsyncAction('_TaskViewModelBase.postData', context: context);

  @override
  Future<void> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
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
  void changeCategory(String newCategory) {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.changeCategory');
    try {
      return super.changeCategory(newCategory);
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDescription(String newDescription) {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.changeDescription');
    try {
      return super.changeDescription(newDescription);
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTitle(String newTitle) {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.changeTitle');
    try {
      return super.changeTitle(newTitle);
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fillCaseList() {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.fillCaseList');
    try {
      return super.fillCaseList();
    } finally {
      _$_TaskViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void postTask() {
    final _$actionInfo = _$_TaskViewModelBaseActionController.startAction(
        name: '_TaskViewModelBase.postTask');
    try {
      return super.postTask();
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
taskController: ${taskController},
postTaskController: ${postTaskController},
listTileLength: ${listTileLength},
checkboxValue: ${checkboxValue},
isLoading: ${isLoading},
taskData: ${taskData},
taskListLength: ${taskListLength},
taskCategory: ${taskCategory},
taskDescription: ${taskDescription},
taskTitle: ${taskTitle},
taskList: ${taskList},
taskCaseList: ${taskCaseList},
checkboxValueList: ${checkboxValueList}
    ''';
  }
}
