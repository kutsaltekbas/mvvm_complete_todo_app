import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/app_theme_light.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/task_data_model.dart.dart';
import '../viewmodel/task_open_view_model.dart';
import 'package:mobx/mobx.dart';

class TaskOpenView extends StatelessWidget {
  final Task task;

  const TaskOpenView({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TaskOpenViewModel>(
      viewModel: TaskOpenViewModel(task),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
            backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
            appBar: AppBar(
              backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
              title: Text(
                task.title.toString(),
                style: TextStyle(
                    color:
                        AppThemeLight.instance.theme.colorScheme.onBackground,
                    fontSize: 24.sp),
              ),
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24.w,
                  color: AppThemeLight.instance.theme.colorScheme.onSurface,
                ),
                onPressed: viewmodel.goBack,
              ),
            ),
            body: Container(
              width: context.width,
              height: context.height,
              child: ListView.builder(
                  itemCount: task.subtask!.tasks!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 400.h,
                      padding: context.paddingNormal,
                      height: 200.h,
                      child: Card(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        elevation: 3,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                                padding: context.paddingLow,
                                width: 360.h,
                                height: 190.h,
                                child: Text(
                                    task.subtask!.tasks![index].toString())),
                            SizedBox(
                              width: 10.w,
                            ),
                            Observer(builder: (_) {
                              return CircleAvatar(
                                backgroundColor: task.subtask!.taskCases![index]
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: viewmodel.changeCircleAvatarColor,
                                  icon: Icon(Icons.check),
                                  iconSize: 40.h,
                                  color: AppThemeLight
                                      .instance.theme.colorScheme.background,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  }),
            ));
      },
    );
  }
}
