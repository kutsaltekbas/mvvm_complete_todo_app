
import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_complete_todo_app/view/homepage/view/homepage_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;
  NavigationRoute._init(); 

  Route<dynamic> generateRoute(RouteSettings args){
    switch (args.name) {
      case NavigationConstants.HOME_PAGE_VIEW:
      return MaterialPageRoute(builder: (context)=>HomePageView());
        
        
       default:
       return MaterialPageRoute(builder: (context)=>Scaffold(
        body: Center(child: Text("UNEXPECTED ERROR"),),
       ));
    }

  }
}