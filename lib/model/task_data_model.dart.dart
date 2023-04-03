class TaskDataModel {
  Task? task;

  TaskDataModel({this.task});

  TaskDataModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? body;
  int? taskId;

  Task({this.title, this.body, this.taskId});

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    taskId = json['taskId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['taskId'] = this.taskId;
    return data;
  }
}
