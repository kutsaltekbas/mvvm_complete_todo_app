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
        return WillPopScope(
          onWillPop: () => Future.value(true),
          child: pageBody(viewmodel, context),
        );
      },
    );
  }

  Scaffold pageBody(TaskOpenViewModel viewmodel, BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.surface,
        appBar: appbar(viewmodel, context),
        body: body(context, viewmodel));
  }

  Container body(BuildContext context, TaskOpenViewModel viewmodel) {
    return Container(
      width: context.width,
      height: context.height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: task.subtask!.tasks!.length,
          itemBuilder: (context, index) {
            return taskDetailCard(context, index, viewmodel);
          }),
    );
  }

  Container taskDetailCard(
      BuildContext context, int index, TaskOpenViewModel viewmodel) {
    return Container(
      width: 400.h,
      padding: context.paddingNormal,
      height: 200.h,
      child: Card(
        color: context.colors.background,
        elevation: 3,
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
                padding: context.paddingLow,
                width: 310.h,
                height: 190.h,
                child: Text(
                  task.subtask!.tasks![index].toString(),
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.colors.secondaryContainer),
                )),
            SizedBox(
              width: 10.w,
            ),
            Observer(builder: (_) {
              return caseButton(viewmodel, index);
            })
          ],
        ),
      ),
    );
  }

  CircleAvatar caseButton(TaskOpenViewModel viewmodel, int index) {
    return CircleAvatar(
        backgroundColor: viewmodel.taskCaseList[index]
            ? Colors.greenAccent
            : Colors.redAccent,
        child: viewmodel.taskCaseList[index]
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewmodel.changeCircleAvatarColor(index);
                },
                icon: Icon(Icons.check),
                iconSize: 40.h,
                color: AppThemeLight.instance.theme.colorScheme.background,
              )
            : IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewmodel.changeCircleAvatarColor(index);
                },
                icon: Icon(Icons.close),
                iconSize: 40.h,
                color: AppThemeLight.instance.theme.colorScheme.background,
              ));
  }

  AppBar appbar(TaskOpenViewModel viewmodel, BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        task.title.toString(),
        style: TextStyle(
            color: AppThemeLight.instance.theme.colorScheme.onBackground,
            fontSize: 24.sp),
      ),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 24.w,
          color: context.colors.secondaryContainer,
        ),
        onPressed: viewmodel.goBack,
      ),
    );
  }
}
