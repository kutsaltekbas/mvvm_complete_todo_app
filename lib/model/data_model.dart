class DataModel {
  int? userId;
  TaskList? taskList;

  DataModel({this.userId, this.taskList});

  DataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    taskList = json['taskList'] != null
        ? new TaskList.fromJson(json['taskList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.taskList != null) {
      data['taskList'] = this.taskList!.toJson();
    }
    return data;
  }
}

class TaskList {
  Task? task;

  TaskList({this.task});

  TaskList.fromJson(Map<String, dynamic> json) {
    task = json['task'] != null ? new Task.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.task != null) {
      data['task'] = this.task!.toJson();
    }
    return data;
  }
}

class Task {
  int? taskId;
  String? title;
  String? body;

  Task({this.taskId, this.title, this.body});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this.taskId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
