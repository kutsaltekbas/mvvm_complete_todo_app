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
          appBar: AppBar(
            leading: IconButton(
              onPressed: viewmodel.returnHomePage,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppThemeLight.instance.theme.colorScheme.onSurface,
              ),
            ),
            backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
            elevation: 0,
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: AppThemeLight.instance.theme.colorScheme.onBackground),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    viewmodel.changeTitle(title);
                    viewmodel.postTask();
                    // viewmodel.fillCaseList();
                    // viewmodel.postData();
                  },
                  icon: Icon(
                    Icons.fact_check,
                    color: AppThemeLight.instance.theme.colorScheme.onSurface,
                  ))
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
            backgroundColor: AppThemeLight.instance.theme.colorScheme.onSurface,
            child: Icon(Icons.add),
          ),
          body: Observer(builder: (_) {
            inspect(viewmodel.checkboxValueList);
            return ListView.builder(
                itemCount: viewmodel.checkboxValueList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: context.paddingLow,
                      child: Container(
                        width: context.width,
                        height: 100.h,
                        child: Card(
                          elevation: 5,
                          child: Container(
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
                          ),
                        ),
                      ));
                }));
          }),
        );
      },
    );
  }
}
