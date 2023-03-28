import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel{
  void init();
  void setContext(BuildContext context);
  late BuildContext viewModelContext;
  NavigationService navigator = NavigationService.instance;
}