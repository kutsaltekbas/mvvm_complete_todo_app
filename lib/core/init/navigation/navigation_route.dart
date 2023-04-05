import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/view/task_open_view/view/task_open_view.dart';
import '../../../model/task_data_model.dart.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../view/homepage/view/homepage_view.dart';

import '../../../view/login/view/login_view.dart';
import '../../../view/on board/view/onboard_view.dart';
import '../../../view/setting/view/settings_view.dart';
import '../../../view/task list/view/task_list_view.dart';
import '../../../view/task/view/task_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_PAGE_VIEW:
        return MaterialPageRoute(builder: (context) => HomePageView());
      case NavigationConstants.LOGIN_VIEW:
        return MaterialPageRoute(builder: (context) => LoginView());
      case NavigationConstants.ON_BOARD_VIEW:
        return MaterialPageRoute(builder: (context) => OnBoardView());
      case NavigationConstants.SETTINGS_VIEW:
        return MaterialPageRoute(builder: (context) => SettingsView());
      case NavigationConstants.TASK_LIST_VIEW:
        return MaterialPageRoute(builder: (context) => TaskListView());
      case NavigationConstants.TASK_OPEN_VIEW:
        final Task task = args.arguments as Task;
        return MaterialPageRoute(
            builder: (context) => TaskOpenView(
                  task: task,
                ));
      case NavigationConstants.TASK_VIEW:
        final String title = args.arguments as String;
        return MaterialPageRoute(
            builder: (context) => TaskView(
                  title: title,
                ));

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("UNEXPECTED ERROR"),
                  ),
                ));
    }
  }
}
