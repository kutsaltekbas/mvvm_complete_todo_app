import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/core/init/navigation/INavigationService.dart';

class NavigationService implements INavigationService{
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;
  NavigationService._init();
  

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;
@override
  Future<void> navigateToPage({required String path,required Object object}) async {
    await navigatorKey.currentState!.pushNamed(path,arguments: object);
  }
  @override
  Future<void> navigateToPageClear({required String path,required Object object}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path,removeAllOldRoutes,arguments: object);
  }
  
  
}