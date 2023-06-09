import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';
import '../viewmodel/homepage_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
      viewModel: HomePageViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          backgroundColor: context.colors.surface,
          appBar: AppBar(
            title: title(context),
            backgroundColor: context.colors.surface,
            elevation: 0,
            actions: [settingsIcon(viewmodel, context)],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  showTaskCard(viewmodel, context),
                  SizedBox(
                    height: 20.h,
                  ),
                  addTaskButton(context, viewmodel),
                  SizedBox(
                    height: 20.h,
                  ),
                  headline2Text(context),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      dailyRoutineCard(viewmodel, context),
                      SizedBox(
                        width: 10.w,
                      ),
                      schoolCard(viewmodel, context),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      workCard(viewmodel, context),
                      SizedBox(
                        width: 10.w,
                      ),
                      billCard(viewmodel, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector billCard(HomePageViewModel viewmodel, BuildContext context) {
    return GestureDetector(
      onTap: viewmodel.addTaskBills,
      child: Container(
        width: 200.w,
        height: 150.h,
        decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 90.w,
                height: 80.h,
                padding: context.paddingLow,
                child: Image.asset("asset/image/bill.png")),
            Container(
                width: 200.w,
                height: 60.h,
                padding: context.paddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.home_card_3_3_title.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: context.colors.secondaryContainer),
                    ),
                    Text(
                      LocaleKeys.home_card_3_3_subtitle.tr(),
                      style: TextStyle(
                          color: context.colors.secondaryContainer,
                          fontStyle: FontStyle.italic,
                          fontSize: 12.sp),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  GestureDetector workCard(HomePageViewModel viewmodel, BuildContext context) {
    return GestureDetector(
      onTap: viewmodel.addTaskWork,
      child: Container(
        width: 140.w,
        height: 150.h,
        decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 90.w,
                height: 80.h,
                padding: context.paddingLow,
                child: Image.asset(
                  "asset/image/work.png",
                  fit: BoxFit.cover,
                )),
            Container(
                width: 200.w,
                height: 70.h,
                padding: context.paddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.home_card_3_2_title.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: context.colors.secondaryContainer),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        LocaleKeys.home_card_3_2_subtitle.tr(),
                        style: TextStyle(
                            color: context.colors.secondaryContainer,
                            fontStyle: FontStyle.italic,
                            fontSize: 12.sp),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  GestureDetector schoolCard(
      HomePageViewModel viewmodel, BuildContext context) {
    return GestureDetector(
      onTap: viewmodel.addTaskSchool,
      child: Container(
        width: 140.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 90.w,
                height: 80.h,
                padding: context.paddingLow,
                child: Image.asset("asset/image/school.png")),
            Container(
                width: 220.w,
                height: 60.h,
                padding: context.paddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.home_card_3_1_title.tr(),
                        style: TextStyle(
                            color: context.colors.secondaryContainer,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        LocaleKeys.home_card_3_1_subtitle.tr(),
                        style: TextStyle(
                            color: context.colors.secondaryContainer,
                            fontStyle: FontStyle.italic,
                            fontSize: 11.sp),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  GestureDetector dailyRoutineCard(
      HomePageViewModel viewmodel, BuildContext context) {
    return GestureDetector(
      onTap: viewmodel.addTaskDailyRoutine,
      child: Container(
        width: 200.w,
        height: 150.h,
        decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 90.w,
                height: 80.h,
                padding: context.paddingLow,
                child: Image.asset("asset/image/routine.png")),
            Container(
                width: 200.w,
                height: 60.h,
                padding: context.paddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.home_card_3_0_title.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: context.colors.secondaryContainer),
                    ),
                    Text(
                      LocaleKeys.home_card_3_0_subtitle.tr(),
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12.sp,
                          color: context.colors.secondaryContainer),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Row headline2Text(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.home_heading2_headline1.tr(),
          style: TextStyle(
              color: context.colors.secondaryContainer,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    color: Colors.black12,
                    offset: Offset(0, 1.5),
                    blurRadius: 5)
              ]),
        ),
      ],
    );
  }

  Container addTaskButton(BuildContext context, HomePageViewModel viewmodel) {
    return Container(
        width: context.width,
        height: 100.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: context.colors.background),
            onPressed: viewmodel.addTask,
            child: ListTile(
              title: Text(
                LocaleKeys.home_card2_title.tr(),
                style: TextStyle(
                    color: context.colors.secondaryContainer,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(0, 1.5),
                          blurRadius: 5)
                    ]),
              ),
              trailing: Icon(
                Icons.add,
                size: 50.h,
                color: context.colors.secondaryContainer,
              ),
            )));
  }

  GestureDetector showTaskCard(
      HomePageViewModel viewmodel, BuildContext context) {
    return GestureDetector(
      onTap: viewmodel.showTasks,
      child: Container(
        width: context.width,
        height: 200.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 5)
            ],
            color: context.colors.background,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              width: 190.w,
              height: 100.h,
              child: ListTile(
                title: Text(
                  LocaleKeys.home_card1_title.tr(),
                  style: TextStyle(
                      color: context.colors.secondaryContainer,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(0, 1.5),
                            blurRadius: 5)
                      ]),
                ),
                subtitle: Text(
                  LocaleKeys.home_card1_subtitle.tr(),
                  style:
                      TextStyle(fontSize: 16.sp, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/image/task.png"),
                      fit: BoxFit.contain)),
            )
          ],
        ),
      ),
    );
  }

  IconButton settingsIcon(HomePageViewModel viewmodel, BuildContext context) {
    return IconButton(
        onPressed: viewmodel.settings,
        icon: Icon(
          Icons.menu,
          size: 30.w,
          color: context.colors.secondaryContainer,
        ));
  }

  Text title(BuildContext context) {
    return Text(
      LocaleKeys.splash_todo.tr(),
      style: TextStyle(
          color: context.colors.secondaryContainer,
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }
}
