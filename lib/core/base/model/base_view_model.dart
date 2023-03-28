import 'package:flutter/material.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel{
  void init();
  void setContext(BuildContext context);
  late BuildContext viewModelContext;
  NavigationService navigator = NavigationService.instance;
}