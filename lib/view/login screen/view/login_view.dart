import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/app_theme_light.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: SingleChildScrollView(
            child: Container(
              width: 390.w,
              height: 844.h,
              color: AppThemeLight.instance.theme.colorScheme.primary,
              //decoration: background(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.h, 40.h, 0, 0),
                    child: SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: FloatingActionButton(
                          backgroundColor:
                              AppThemeLight.instance.theme.colorScheme.surface,
                          child: Icon(
                            Icons.arrow_back,
                            color: AppThemeLight
                                .instance.theme.colorScheme.primary,
                            size: 30.w,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                  welcomeBackText(),
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    width: 1080.w,
                    height: 500.h,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurStyle: BlurStyle.normal,
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 20.h,
                            spreadRadius: 10.h)
                      ],
                      color: context.colorScheme.surface,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.w, 60.h, 30.w, 10.h),
                              child: TextField(
                                cursorColor: AppThemeLight
                                    .instance.theme.colorScheme.primary,
                                decoration: InputDecoration(
                                    prefixIconColor: AppThemeLight
                                        .instance.theme.colorScheme.primary,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusColor: AppThemeLight
                                        .instance.theme.colorScheme.primary,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppThemeLight
                                            .instance.theme.colorScheme.primary,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.person),
                                    filled: true,
                                    fillColor: AppThemeLight
                                        .instance.theme.colorScheme.surface,
                                    hintText: LocaleKeys.login_email.tr(),
                                    hintStyle:
                                        TextStyle(fontStyle: FontStyle.italic)),
                              ),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                                child: TextField(
                                  obscureText: true,
                                  cursorColor: AppThemeLight
                                      .instance.theme.colorScheme.primary,
                                  decoration: InputDecoration(
                                      prefixIconColor: AppThemeLight
                                          .instance.theme.colorScheme.primary,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusColor: AppThemeLight
                                          .instance.theme.colorScheme.primary,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppThemeLight.instance.theme
                                              .colorScheme.primary,
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: Icon(Icons.remove_red_eye),
                                      filled: true,
                                      fillColor: AppThemeLight
                                          .instance.theme.colorScheme.surface,
                                      hintText: LocaleKeys.login_password.tr(),
                                      hintStyle: TextStyle(
                                          fontStyle: FontStyle.italic)),
                                )),
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  LocaleKeys.login_forgotText.tr(),
                                  style: TextStyle(
                                      color: AppThemeLight
                                          .instance.theme.colorScheme.primary,
                                      fontSize: 13.h),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 150.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          width: 300.w,
                          height: 70.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppThemeLight
                                      .instance.theme.colorScheme.primary,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {},
                              child: Text(
                                LocaleKeys.login_login.tr(),
                                style: TextStyle(fontSize: 20.sp),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(LocaleKeys.login_dontAccount.tr() + " "),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                LocaleKeys.login_signUp.tr(),
                                style: TextStyle(
                                    color: AppThemeLight
                                        .instance.theme.colorScheme.primary,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget welcomeBackText() {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Text(
        LocaleKeys.login_welcomeBack.tr(),
        maxLines: 2,
        style: TextStyle(
          color: Colors.white,
          fontSize: 48.sp,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0, 5.h),
              blurRadius: 10,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }

  // BoxDecoration background() {
  //   return BoxDecoration(
  //       image: DecorationImage(
  //           image: AssetImage("asset/image/background.jpg"),
  //           fit: BoxFit.cover));
  // }
}
