
import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_complete_todo_app/view/homepage/view/homepage_view.dart';

import '../../../view/login/view/login_view.dart';
import '../../../view/on board/view/onboard_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;
  NavigationRoute._init(); 

  Route<dynamic> generateRoute(RouteSettings args){
    switch (args.name) {
      case NavigationConstants.HOME_PAGE_VIEW:
      return MaterialPageRoute(builder: (context)=>HomePageView());
      case NavigationConstants.LOGIN_VIEW:
      return MaterialPageRoute(builder: (context)=>LoginView());
      case NavigationConstants.ON_BOARD_VIEW:
      return MaterialPageRoute(builder: (context)=>OnBoardView());
        
        
       default:
       return MaterialPageRoute(builder: (context)=>Scaffold(
        body: Center(child: Text("UNEXPECTED ERROR"),),
       ));
    }

  }
}