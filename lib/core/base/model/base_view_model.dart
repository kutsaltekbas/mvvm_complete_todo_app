import 'package:flutter/material.dart';

abstract class BaseViewModel{
  void init();
  void setContext(BuildContext context);
  late BuildContext viewModelContext;
}