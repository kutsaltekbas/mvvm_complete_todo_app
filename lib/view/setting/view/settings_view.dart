import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';
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
          body: pageBody(context, viewmodel),
        );
      },
    );
  }

  SafeArea pageBody(BuildContext context, SettingsViewModel viewmodel) {
    return SafeArea(
      child: Column(
        //this page will be redraw with listview.builder in the future.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topPage(context, viewmodel),
          accountText(context),
          changeThemeCard(context),
          SizedBox(
            height: 20.h,
          ),
          changeLanguageCard(context,viewmodel),
          SizedBox(
            height: 20.h,
          ),
          resetPasswordCard(context),
          SizedBox(
            height: 20.h,
          ),
          signOutCard(context,viewmodel),
          SizedBox(
            height: 10.h,
          ),
          bottomPage(context),
          SizedBox(
            height: 20.h,
          ),
          aboutProjectCard(context),
          SizedBox(
            height: 10.h,
          ),
          contributorCard(context),
        ],
      ),
    );
  }

  Padding contributorCard(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Container(
        width: context.width,
        height: 70.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ],
            color: AppThemeLight.instance.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.developer_board),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.h,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
          title: Text(
            LocaleKeys.home_setting_about_contribitions.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding aboutProjectCard(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Container(
        width: context.width,
        height: 70.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ],
            color: AppThemeLight.instance.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.contact_mail),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.h,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
          title: Text(
            LocaleKeys.home_setting_about_title.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding bottomPage(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(
        LocaleKeys.home_setting_about_info.tr(),
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding signOutCard(BuildContext context,SettingsViewModel viewModel) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: GestureDetector(
        onTap: viewModel.signOut,
        child: Container(
          width: context.width,
          height: 70.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
              ],
              color: AppThemeLight.instance.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 24.w,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24.h,
                color: AppThemeLight.instance.theme.colorScheme.onSurface,
              ),
              onPressed: () {},
            ),
            title: Text(
              LocaleKeys.home_setting_core_signOutTitle.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text(
            //   LocaleKeys.home_setting_core_signOutDesc.tr(),
            //   style: TextStyle(fontSize: 12.sp),
            // ),
          ),
        ),
      ),
    );
  }

  Padding resetPasswordCard(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Container(
        width: context.width,
        height: 70.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ],
            color: AppThemeLight.instance.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(
            Icons.change_circle,
            size: 24.w,
            color: AppThemeLight.instance.theme.colorScheme.onSurface,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.h,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
          title: Text(
            LocaleKeys.home_setting_core_changePasswordTitle.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text(
          //   LocaleKeys.home_setting_core_changePasswordDesc.tr(),
          //   style: TextStyle(fontSize: 12.sp),
          // ),
        ),
      ),
    );
  }

  Padding changeLanguageCard(BuildContext context,SettingsViewModel viewmodel) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: GestureDetector(
        onTap: viewmodel.changeLanguage,
        child: Container(
          width: context.width,
          height: 70.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
              ],
              color: AppThemeLight.instance.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(
              Icons.language_rounded,
              size: 24.w,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24.h,
                color: AppThemeLight.instance.theme.colorScheme.onSurface,
              ),
              onPressed: () {},
            ),
            title: Text(
              LocaleKeys.home_setting_core_langTitle.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text(
            //   LocaleKeys.home_setting_core_langDesc.tr(),
            //   style: TextStyle(
            //     fontSize: 12.sp,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  Padding changeThemeCard(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Container(
        width: context.width,
        height: 70.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ],
            color: AppThemeLight.instance.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(
            Icons.lightbulb,
            size: 24.w,
            color: AppThemeLight.instance.theme.colorScheme.onSurface,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.h,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
          title: Text(
            LocaleKeys.home_setting_core_themeTitle.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text(
          //   LocaleKeys.home_setting_core_themeDesc.tr(),
          //   style: TextStyle(fontSize: 13.sp),
          // ),
        ),
      ),
    );
  }

  Padding accountText(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(
        LocaleKeys.home_setting_account.tr(),
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container topPage(BuildContext context, SettingsViewModel viewmodel) {
    return Container(
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
                goBackButton(viewmodel),
                SizedBox(
                  width: 110.w,
                ),
                title(),
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
            child: userCard(viewmodel),
          ),
        ],
      ),
    );
  }

  ListTile userCard(SettingsViewModel viewmodel) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppThemeLight.instance.theme.colorScheme.onSurface,
        radius: 30.h,
        child: Icon(
          Icons.person,
          size: 30.w,
          color: AppThemeLight.instance.theme.colorScheme.background,
        ),
      ),
      title: Text(
        LocaleKeys.home_setting_user.tr(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
      ),
      subtitle: Text(
        viewmodel.eMail,
        style: TextStyle(fontSize: 16.sp),
      ),
      tileColor: AppThemeLight.instance.theme.colorScheme.background,
    );
  }

  Text title() {
    return Text(
      LocaleKeys.home_setting_title.tr(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
    );
  }

  IconButton goBackButton(SettingsViewModel viewmodel) {
    return IconButton(
      onPressed: viewmodel.returnHomePage,
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      iconSize: 25.w,
      color: AppThemeLight.instance.theme.colorScheme.onSurface,
    );
  }
}
