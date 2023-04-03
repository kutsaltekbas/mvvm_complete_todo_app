import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../../../core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  // @observable
  // final Future<Response> response = http.get(Uri.parse(
  //     "https://network-service-test-default-rtdb.europe-west1.firebasedatabase.app/user.json"));

  @observable
  Map<String, dynamic> data = {"test": "test"};

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  void postData() {
    http.post(
        Uri.parse("https://network-service-test-default-rtdb.europe-west1.firebasedatabase.app/user1.json"),body: jsonEncode(data));
  }

  @observable
  String textData = "test";

  @action
  Future<void> getData() async {
    Response response = await http.get(Uri.parse(
        "https://network-service-test-default-rtdb.europe-west1.firebasedatabase.app/user.json"));
    data = jsonDecode(response.body);
  }
}
