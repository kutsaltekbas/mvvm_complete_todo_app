import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
part 'task_list_view_model.g.dart';

class TaskListViewModel = _TaskListViewModelBase with _$TaskListViewModel;
abstract class _TaskListViewModelBase with Store, BaseViewModel {

@observable
int dataLength = 50;


@observable
bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }
}