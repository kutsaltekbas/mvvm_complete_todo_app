import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/theme/app_theme_light.dart';
import '../viewmodel/task_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TaskViewModel>(
      viewModel: TaskViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppThemeLight.instance.theme.colorScheme.background,
          appBar: AppBar(
            backgroundColor: AppThemeLight.instance.theme.colorScheme.primary,
            elevation: 0,
            title: Text(
              LocaleKeys.task_taskTitle.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.fact_check))
              // Container(
              //   padding: context.paddingLow,
              //   width: context.width * 0.7,
              //   height: 200.h,
              //   child: TextField(
              //     controller: viewmodel.titleController,
              //     decoration: InputDecoration(
              //         filled: true,
              //         fillColor:
              //             AppThemeLight.instance.theme.colorScheme.surface,
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide.none,
              //             borderRadius: BorderRadius.circular(10))),
              //   ),
              // )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: viewmodel.addTask,
            backgroundColor:
                AppThemeLight.instance.theme.colorScheme.primaryContainer,
            child: Icon(Icons.add),
          ),
          body: Observer(builder: (_) {
            inspect(viewmodel.checkboxValueList);
            return ListView.builder(
                itemCount: viewmodel.checkboxValueList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: context.paddingLow,
                      child: CheckboxListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text(
                          viewmodel.taskList[index],
                          style: TextStyle(
                              color: AppThemeLight
                                  .instance.theme.colorScheme.surface),
                        ),
                        tileColor:
                            AppThemeLight.instance.theme.colorScheme.primary,
                        checkColor:
                            AppThemeLight.instance.theme.colorScheme.primary,
                        activeColor:
                            AppThemeLight.instance.theme.colorScheme.surface,
                        value: viewmodel.checkboxValueList[index],
                        onChanged: (bool? value) {
                          print("onchanged $value");
                          viewmodel.onCheckboxChanged(index, value!);
                        },
                      ));
                }));
          }),
        );
      },
    );
  }
}
