import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';
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
              color: AppThemeLight.instance.theme.colorScheme.surface,
              //decoration: background(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  //backButton(viewmodel),
                  topScreen(),
                  SizedBox(
                    height: 80.h,
                  ),
                  bottomScreen(context, viewmodel)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding backButton(LoginViewModel viewmodel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.h, 40.h, 0, 0),
      child: SizedBox(
        height: 50.h,
        width: 50.h,
        child: FloatingActionButton(
            backgroundColor:
                AppThemeLight.instance.theme.colorScheme.background,
            child: Icon(
              Icons.arrow_back,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
              size: 30.w,
            ),
            onPressed: viewmodel.returnOnboard),
      ),
    );
  }

  Row topScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [welcomeBackText(), userPng()],
    );
  }

  Padding userPng() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/image/todo.png"),
                fit: BoxFit.none,
                scale: 5.w)),
      ),
    );
  }

  Container bottomScreen(BuildContext context, LoginViewModel viewmodel) {
    return Container(
      width: 390.w,
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              emailTextField(viewmodel),
              passwordTextField(viewmodel),
              forgotPasswordButton(viewmodel)
            ],
          ),
          SizedBox(
            height: 150.h,
          ),
          loginButton(viewmodel),
          //signUpButton(viewmodel),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }

  Row signUpButton(LoginViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.tr() + " "),
        GestureDetector(
          onTap: viewmodel.signUp,
          child: Text(
            LocaleKeys.login_signUp.tr(),
            style: TextStyle(
                color: AppThemeLight.instance.theme.colorScheme.primary,
                fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Container loginButton(LoginViewModel viewmodel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: 300.w,
      height: 70.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppThemeLight.instance.theme.colorScheme.onSurface,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () async {
            await viewmodel.login();
          },
          child: Text(
            LocaleKeys.login_login.tr(),
            style: TextStyle(fontSize: 20.sp),
          )),
    );
  }

  Padding forgotPasswordButton(LoginViewModel viewmodel) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w),
      child: GestureDetector(
        onTap: viewmodel.forgotPasswordFunc,
        child: Text(
          LocaleKeys.login_forgotText.tr(),
          style: TextStyle(
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
              fontSize: 13.h),
        ),
      ),
    );
  }

  Padding passwordTextField(LoginViewModel viewmodel) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
        child: TextField(
          controller: viewmodel.passwordController,
          obscureText: true,
          cursorColor: AppThemeLight.instance.theme.colorScheme.primary,
          decoration: InputDecoration(
              prefixIconColor: AppThemeLight.instance.theme.colorScheme.primary,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusColor: AppThemeLight.instance.theme.colorScheme.primary,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppThemeLight.instance.theme.colorScheme.primary,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: AppThemeLight.instance.theme.colorScheme.onSurface,
              ),
              suffixIcon: Icon(Icons.remove_red_eye),
              filled: true,
              fillColor: AppThemeLight.instance.theme.colorScheme.surface,
              hintText: LocaleKeys.login_password.tr(),
              hintStyle: TextStyle(fontStyle: FontStyle.italic)),
        ));
  }

  Padding emailTextField(LoginViewModel viewmodel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 60.h, 30.w, 10.h),
      child: TextField(
        controller: viewmodel.emailController,
        cursorColor: AppThemeLight.instance.theme.colorScheme.primary,
        decoration: InputDecoration(
            prefixIconColor: AppThemeLight.instance.theme.colorScheme.primary,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusColor: AppThemeLight.instance.theme.colorScheme.primary,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppThemeLight.instance.theme.colorScheme.primary,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            filled: true,
            fillColor: AppThemeLight.instance.theme.colorScheme.surface,
            hintText: LocaleKeys.login_email.tr(),
            hintStyle: TextStyle(fontStyle: FontStyle.italic)),
      ),
    );
  }

  Widget welcomeBackText() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 30.h, 5.w, 10.h),
      child: Text(
        LocaleKeys.login_welcomeBack.tr(),
        maxLines: 2,
        style: TextStyle(
          color: AppThemeLight.instance.theme.colorScheme.onBackground,
          fontSize: 50.sp,
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
