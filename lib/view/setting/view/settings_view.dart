import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/app_theme_light.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
          body: SafeArea(
            child: Column(
              //this page will be redraw with listview.builder in the future.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.width,
                  height: 190.h,
                  color: AppThemeLight.instance.theme.colorScheme.background,
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.width,
                        height: 70.h,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: viewmodel.returnHomePage,
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                              iconSize: 25.w,
                            ),
                            SizedBox(
                              width: 110.w,
                            ),
                            Text(
                              LocaleKeys.home_setting_title.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.sp),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2.h,
                        indent: 50.w,
                        endIndent: 50.w,
                      ),
                      Container(
                        width: context.width,
                        height: 100.h,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppThemeLight
                                .instance.theme.colorScheme.primary,
                            radius: 30.h,
                            child: Icon(
                              Icons.person,
                              size: 30.w,
                              color: AppThemeLight
                                  .instance.theme.colorScheme.background,
                            ),
                          ),
                          title: Text(
                            "Holy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.sp),
                          ),
                          subtitle: Text(
                            "senbitmissin@selahattinozdemir.com",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          tileColor: AppThemeLight
                              .instance.theme.colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingLow,
                  child: Text(
                    "Account",
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    width: context.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.lightbulb,
                        size: 24.w,
                        color: AppThemeLight.instance.theme.colorScheme.primary,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.h,
                          color: AppThemeLight
                              .instance.theme.colorScheme.onSurface,
                        ),
                        onPressed: () {},
                      ),
                      title: Text(
                        LocaleKeys.home_setting_core_themeTitle.tr(),
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        LocaleKeys.home_setting_core_themeDesc.tr(),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    width: context.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.language_rounded,
                        size: 24.w,
                        color: AppThemeLight.instance.theme.colorScheme.primary,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.h,
                          color: AppThemeLight
                              .instance.theme.colorScheme.onSurface,
                        ),
                        onPressed: () {},
                      ),
                      title: Text(
                        LocaleKeys.home_setting_core_langTitle.tr(),
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        LocaleKeys.home_setting_core_langDesc.tr(),
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    width: context.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.change_circle,
                        size: 24.w,
                        color: AppThemeLight.instance.theme.colorScheme.primary,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.h,
                          color: AppThemeLight
                              .instance.theme.colorScheme.onSurface,
                        ),
                        onPressed: () {},
                      ),
                      title: Text(
                        LocaleKeys.home_setting_core_changePasswordTitle.tr(),
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        LocaleKeys.home_setting_core_changePasswordDesc.tr(),
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    width: context.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        size: 24.w,
                        color: AppThemeLight.instance.theme.colorScheme.primary,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.h,
                          color: AppThemeLight
                              .instance.theme.colorScheme.onSurface,
                        ),
                        onPressed: () {},
                      ),
                      title: Text(
                        LocaleKeys.home_setting_core_signOutTitle.tr(),
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        LocaleKeys.home_setting_core_signOutDesc.tr(),
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: context.paddingLow,
                  child: Text(
                    "About Developer",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    width: context.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(Icons.contact_mail),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.h,
                          color: AppThemeLight
                              .instance.theme.colorScheme.onSurface,
                        ),
                        onPressed: () {},
                      ),
                      title: Text(
                        LocaleKeys.home_setting_about_title.tr(),
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    width: context.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(Icons.developer_board),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.h,
                          color: AppThemeLight
                              .instance.theme.colorScheme.onSurface,
                        ),
                        onPressed: () {},
                      ),
                      title: Text(
                        LocaleKeys.home_setting_about_contribitions.tr(),
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
