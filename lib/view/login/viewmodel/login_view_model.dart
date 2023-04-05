import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  DatabaseReference db = FirebaseDatabase.instance.ref("user/authenticate");
  @observable
  Dio dio = Dio();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  void forgotPasswordFunc() {}

  @action
  void returnOnboard() {
    navigator.navigatorKey.currentState!.pop();
  }

  @action
  void login() {
    if (dataList[0]["eMail"] == emailController.text &&
        dataList[0]["password"] == "1234") {
      navigator.navigateToPageClear(
          path: NavigationConstants.HOME_PAGE_VIEW, object: Text(""));
    }
  }

  @action
  void signUp() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  List<Map<String, dynamic>> dataList = [];
  @override
  Future<void> init() async {
    var response = await dio.get(
        "https://network-service-test-default-rtdb.europe-west1.firebasedatabase.app/user/authenticate.json");
    dataList.add(response.data);
    inspect(response.data);
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }
}
