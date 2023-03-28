import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/app_theme_light.dart';
import '../../../core/base/view/base_view.dart';
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
          appBar: AppBar(
            leading: IconButton(
              onPressed: viewmodel.returnHomePage,
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: AppThemeLight.instance.theme.colorScheme.primary,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor:
                AppThemeLight.instance.theme.colorScheme.background,
            title: Text(
              LocaleKeys.task_taskListTitle.tr(),
              style: TextStyle(
                  color: AppThemeLight.instance.theme.colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  shadows: [
                    Shadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 2)
                  ]),
            ),
          ),
          body: ListView.builder(
              itemCount: viewmodel.dataLength,
              itemBuilder: (context, index) {
                return Padding(
                  padding: context.paddingLow,
                  child: Container(
                    width: context.width,
                    height: 150.h,
                    decoration: BoxDecoration(
                        color: AppThemeLight.instance.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              blurStyle: BlurStyle.normal)
                        ]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 20.w,
                          child: Text(
                            (index + 1).toString() + ".",
                            style: TextStyle(
                                color: AppThemeLight
                                    .instance.theme.colorScheme.surface,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                          width: 340.w,
                          child: ListTile(
                            title: Text(
                              "TEST",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.sp),
                            ),
                            subtitle: Text(
                              "testestestsetsetestest",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 15.sp,
                                  color: AppThemeLight
                                      .instance.theme.colorScheme.surface,
                                  fontStyle: FontStyle.italic),
                            ),
                            trailing: Icon(
                              Icons.task_alt_rounded,
                              size: 40.w,
                              color: AppThemeLight
                                  .instance.theme.colorScheme.surface,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
