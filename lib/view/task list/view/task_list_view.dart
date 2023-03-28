import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import '../../../core/base/view/base_view.dart';
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
          backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
          body: SafeArea(
            child: Column(
              children: [
                backButtonAndTitle(context, viewmodel),
                Expanded(
                  child: ListView.builder(
                      itemCount: viewmodel.listviewlength,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: context.paddingNormal,
                          child: Container(
                            width: context.width,
                            height: 250.h,
                            decoration: BoxDecoration(
                                color: AppThemeLight
                                    .instance.theme.colorScheme.background,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 5),
                                      blurRadius: 5)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: context.paddingLow,
                                  width: 200.w,
                                  height: 200.h,
                                  child: ListTile(
                                    contentPadding: context.paddingLow,
                                    title: Text(
                                      "Title Test",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "Description blabvalblablablalbalblablalbalblablablalbblabalblablalbalbal",
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 20.h,
                                    ),
                                    Container(
                                      padding: context.paddingLow,
                                      height: 50.w,
                                      width: 100.w,
                                      child: Text(
                                        "32 Days ago",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100.h,
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Colors.greenAccent,
                                        child: Icon(Icons.done,
                                            size: 30.w,
                                            color: AppThemeLight.instance.theme
                                                .colorScheme.background))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding backButtonAndTitle(
      BuildContext context, TaskListViewModel viewmodel) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: viewmodel.returnHomePage,
            elevation: 0,
            backgroundColor:
                AppThemeLight.instance.theme.colorScheme.background,
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            LocaleKeys.task_taskListTitle.tr(),
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
