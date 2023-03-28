import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';
import '../viewmodel/onboard_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          backgroundColor: AppThemeLight.instance.theme.colorScheme.background,
          body: Column(
            children: [
              SizedBox(
                height: 140.h,
              ),
              backgroundImage(context),
              SizedBox(
                height: 50.h,
              ),
              title(),
              SizedBox(
                height: 20.h,
              ),
              subtitle(),
              SizedBox(
                height: 50.h,
              ),
              facebookLoginButton(context, viewmodel),
              googleLoginButton(context, viewmodel),
              eMailLoginButton(context, viewmodel)
            ],
          ),
        );
      },
    );
  }

  Container eMailLoginButton(BuildContext context, OnBoardViewModel viewmodel) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        width: context.width,
        height: 100.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppThemeLight.instance.theme.colorScheme.onSurface,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: viewmodel.emailLogin,
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: AppThemeLight.instance.theme.colorScheme.background,
                size: 50.h,
              ),
              title: Text(
                LocaleKeys.onBoard_emailLogin.tr(),
                style: TextStyle(
                    color: AppThemeLight.instance.theme.colorScheme.background,
                    fontStyle: FontStyle.italic),
              ),
            )));
  }

  Container googleLoginButton(
      BuildContext context, OnBoardViewModel viewmodel) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        width: context.width,
        height: 100.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppThemeLight.instance.theme.colorScheme.inversePrimary,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: viewmodel.googleLogin,
            child: ListTile(
              leading: Icon(
                EvaIcons.google,
                color: AppThemeLight.instance.theme.colorScheme.background,
                size: 50.h,
              ),
              title: Text(
                LocaleKeys.onBoard_googleLogin.tr(),
                style: TextStyle(
                    color: AppThemeLight.instance.theme.colorScheme.background,
                    fontStyle: FontStyle.italic),
              ),
            )));
  }

  Container facebookLoginButton(
      BuildContext context, OnBoardViewModel viewmodel) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        width: context.width,
        height: 100.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppThemeLight.instance.theme.colorScheme.inverseSurface,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: viewmodel.facebookLogin,
            child: ListTile(
              leading: Icon(
                Icons.facebook_rounded,
                color: AppThemeLight.instance.theme.colorScheme.background,
                size: 50.h,
              ),
              title: Text(
                LocaleKeys.onBoard_facebookLogin.tr(),
                style: TextStyle(
                    color: AppThemeLight.instance.theme.colorScheme.background,
                    fontStyle: FontStyle.italic),
              ),
            )));
  }

  Text subtitle() {
    return Text(
      LocaleKeys.onBoard_subtitle.tr(),
      style: TextStyle(
          fontStyle: FontStyle.italic,
          color: AppThemeLight.instance.theme.colorScheme.onSurface,
          fontSize: 16.sp),
    );
  }

  Text title() {
    return Text(
      LocaleKeys.onBoard_title.tr(),
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, shadows: [
        Shadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 5)
      ]),
    );
  }

  Container backgroundImage(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/image/onboard.png"))),
    );
  }
}
