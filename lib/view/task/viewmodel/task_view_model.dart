import 'dart:developer';
import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_complete_todo_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/app_theme_light.dart';

import '../../../core/base/model/base_view_model.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store, BaseViewModel {
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController taskController = TextEditingController();

  @observable
  int listTileLength = 0;
  @observable
  bool? checkboxValue = false;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
  @action
  Future<void> addTaskToList() async {
    taskList.add(taskController.text);
    listTileLength = taskList.length;
    checkboxValueList.add(false);
    Navigator.pop(viewModelContext);
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @observable
  List<String> taskList = [];

  @action
  void addTask() {
    showDialog(
        barrierDismissible: false,
        context: viewModelContext,
        builder: (viewModelContext) {
          return AlertDialog(
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsOverflowDirection: VerticalDirection.up,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeLight
                              .instance.theme.colorScheme.onSurface),
                      onPressed: () {
                        Navigator.pop(viewModelContext);
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 100.w,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeLight
                              .instance.theme.colorScheme.onSurface),
                      onPressed: addTaskToList,
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 50),
                width: 500.w,
                height: viewModelContext.mediaQuery.viewInsets.bottom > 0
                    ? 150.h
                    : 200.h,
                child: Padding(
                  padding: viewModelContext.paddingLow,
                  child: TextField(
                    maxLength: 160,
                    controller: taskController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppThemeLight
                            .instance.theme.colorScheme.background),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
            elevation: 10,
            backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
            icon: Icon(
              Icons.task_alt_rounded,
              size: 32.w,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            title: Text(
              LocaleKeys.taskPage_addTastTitle.tr(),
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppThemeLight.instance.theme.colorScheme.onBackground),
            ),
          );
        });
  }

  @observable
  ObservableList<bool> checkboxValueList = ObservableList.of([]);

  @action
  void onCheckboxChanged(int index, bool value) {
    checkboxValueList[index] = value;
    checkboxValueList = checkboxValueList;
    inspect(checkboxValueList);
  }

  @action
  bool checkboxCase(int index) {
    return checkboxValueList[index];
  }

  @action
  void returnHomePage() {
    navigator.navigateToPageClear(
        path: NavigationConstants.HOME_PAGE_VIEW, object: Text(""));
  }
}
