import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/theme/app_theme_light.dart';
import '../viewmodel/task_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key, required this.title}) : super(key: key);
  final String title;

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
          backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
          appBar: appbar(viewmodel),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: addTaskButton(viewmodel),
          body: pageBody(viewmodel),
        );
      },
    );
  }

  Observer pageBody(TaskViewModel viewmodel) {
    return Observer(builder: (_) {
          inspect(viewmodel.checkboxValueList);
          return ListView.builder(
              itemCount: viewmodel.checkboxValueList.length,
              itemBuilder: ((context, index) {
                return builderItem(context, viewmodel, index);
              }));
        });
  }

  Padding builderItem(BuildContext context, TaskViewModel viewmodel, int index) {
    return Padding(
                  padding: context.paddingLow,
                  child: Container(
                    width: context.width,
                    height: 100.h,
                    child: Card(
                      elevation: 5,
                      child: taskWidget(context, viewmodel, index),
                    ),
                  ));
  }

  Container taskWidget(BuildContext context, TaskViewModel viewmodel, int index) {
    return Container(
                      padding: context.paddingLow,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        viewmodel.taskList[index],
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: AppThemeLight
                                .instance.theme.colorScheme.onBackground),
                      ),
                    );
  }

  FloatingActionButton addTaskButton(TaskViewModel viewmodel) {
    return FloatingActionButton(
          onPressed: viewmodel.addTask,
          backgroundColor: AppThemeLight.instance.theme.colorScheme.onSurface,
          child: Icon(Icons.add),
        );
  }

  AppBar appbar(TaskViewModel viewmodel) {
    return AppBar(
          leading: goBackButton(viewmodel),
          backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
          elevation: 0,
          title: taskTitle(),
          actions: [
            postTaskButton(viewmodel)
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
        );
  }

  IconButton postTaskButton(TaskViewModel viewmodel) {
    return IconButton(
              onPressed: () {
                viewmodel.changeTitle(title);
                viewmodel.postTask();
                // viewmodel.fillCaseList();
                // viewmodel.postData();
              },
              icon: Icon(
                Icons.fact_check,
                color: AppThemeLight.instance.theme.colorScheme.onSurface,
              ));
  }

  Text taskTitle() {
    return Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: AppThemeLight.instance.theme.colorScheme.onBackground),
        );
  }

  IconButton goBackButton(TaskViewModel viewmodel) {
    return IconButton(
          onPressed: viewmodel.returnHomePage,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppThemeLight.instance.theme.colorScheme.onSurface,
          ),
        );
  }
}
