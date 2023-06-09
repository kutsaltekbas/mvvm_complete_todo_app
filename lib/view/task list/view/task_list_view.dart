import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';
import '../viewmodel/task_list_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TaskListViewModel>(
      viewModel: TaskListViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
            backgroundColor: context.colors.surface,
            body: pageBody(viewmodel, context));
      },
    );
  }

  Observer pageBody(TaskListViewModel viewmodel, BuildContext context) {
    return Observer(
      builder: (_) => viewmodel.isLoading == true
          ? loadingView()
          : homeView(context, viewmodel),
    );
  }

  SafeArea homeView(BuildContext context, TaskListViewModel viewmodel) {
    return SafeArea(
      child: Column(
        children: [
          backButtonAndTitle(context, viewmodel),
          taskCards(viewmodel, context)
        ],
      ),
    );
  }

  Expanded taskCards(TaskListViewModel viewmodel, BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: viewmodel.listviewlength,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.paddingNormal,
              child: GestureDetector(
                onTap: () {
                  viewmodel.changeSelectedData(index);

                  viewmodel.openTask();
                },
                child: Container(
                  width: context.width,
                  height: 250.h,
                  decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 5)
                      ]),
                  child: Container(
                    padding: context.paddingLow,
                    width: 200.w,
                    height: 200.h,
                    child: taskListTile(context, viewmodel, index),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Column taskCardRight(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.h,
        ),
        Container(
          padding: context.paddingLow,
          height: 50.w,
          width: 100.w,
          child: Text(
            "",
            style: TextStyle(fontSize: 15.sp, fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
        CircleAvatar(
            backgroundColor: Colors.greenAccent,
            child: Icon(Icons.done,
                size: 30.w,
                color: AppThemeLight.instance.theme.colorScheme.background))
      ],
    );
  }

  ListTile taskListTile(
      BuildContext context, TaskListViewModel viewmodel, int index) {
    return ListTile(
      contentPadding: context.paddingLow,
      title: Text(
        viewmodel.dataList[index].title.toString(),
        style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: context.colors.secondaryContainer),
      ),
      subtitle: Text(
        viewmodel.dataList[index].description.toString(),
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }

  Center loadingView() => Center(child: CircularProgressIndicator());

  Padding backButtonAndTitle(
      BuildContext context, TaskListViewModel viewmodel) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        children: [
          IconButton(
            onPressed: viewmodel.returnHomePage,
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: context.colors.secondaryContainer,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            LocaleKeys.task_taskListTitle.tr(),
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.secondaryContainer),
          ),
        ],
      ),
    );
  }
}
