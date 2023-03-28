import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
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
                height: 150.h,
                child: Row(
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
                        onPressed: () {
                          navigator.navigateToPage(
                              path: NavigationConstants.TASK_VIEW,
                              object: Text(""));
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
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
                        fillColor:
                            AppThemeLight.instance.theme.colorScheme.onSurface),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
            elevation: 10,
            backgroundColor:
                AppThemeLight.instance.theme.colorScheme.background,
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

  @action
  void addTaskDailyRoutine() {}
  @action
  void addTaskSchool() {}
  @action
  void addTaskWork() {}
  @action
  void addTaskBills() {}
}
