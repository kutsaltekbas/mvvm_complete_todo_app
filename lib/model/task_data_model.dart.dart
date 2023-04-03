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
  int? taskId;
  bool? isDone;
  String? category;
  String? description;
  List<String>? subtask;

  Task(
      {this.title,
      this.taskId,
      this.isDone,
      this.category,
      this.description,
      this.subtask});

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    taskId = json['taskId'];
    isDone = json['isDone'];
    category = json['category'];
    description = json['description'];
    subtask = json['subtask'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['taskId'] = this.taskId;
    data['isDone'] = this.isDone;
    data['category'] = this.category;
    data['description'] = this.description;
    data['subtask'] = this.subtask;
    return data;
  }
}
