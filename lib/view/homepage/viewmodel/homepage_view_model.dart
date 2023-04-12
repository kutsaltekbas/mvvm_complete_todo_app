import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/language_manager.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';
part 'homepage_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;

  @observable
  TextEditingController addTaskTitleController = TextEditingController();

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  void settings() {
    navigator.navigateToPage(
        path: NavigationConstants.SETTINGS_VIEW, object: Text(""));
  }

  @action
  void showTasks() {
    navigator.navigateToPage(
        path: NavigationConstants.TASK_LIST_VIEW, object: Text(""));
  }

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
              SizedBox(
                width: viewModelContext.width,
                height: 70.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                viewModelContext.colors.background),
                        onPressed: () {
                          Navigator.pop(viewModelContext);
                        },
                        child: Text(
                          LocaleKeys.home_addTaskDialog_back.tr(),
                          style: TextStyle(
                              color: viewModelContext.colors.secondaryContainer,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: 100.w,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                viewModelContext.colors.background),
                        onPressed: () {
                          navigator.navigateToPage(
                              path: NavigationConstants.TASK_VIEW,
                              object: addTaskTitleController.text);
                        },
                        child: Text(
                          LocaleKeys.home_addTaskDialog_add.tr(),
                          style: TextStyle(
                              color: viewModelContext.colors.secondaryContainer,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
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
                    controller: addTaskTitleController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: viewModelContext.colors.background),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
            elevation: 10,
            backgroundColor: viewModelContext.colors.surface,
            icon: Icon(
              Icons.task_alt_rounded,
              size: 32.w,
              color: viewModelContext.colors.secondaryContainer,
            ),
            title: Text(
              LocaleKeys.home_addTaskDialog_title.tr(),
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: viewModelContext.colors.secondaryContainer),
            ),
          );
        });
  }

  @action
  void addTaskDailyRoutine() {}
  @action
  void addTaskSchool() {}
  @action
  void addTaskWork() {}
  @action
  void addTaskBills() {}
}
