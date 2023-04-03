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
  Subtask? subtask;

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
    subtask =
        json['subtask'] != null ? new Subtask.fromJson(json['subtask']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['taskId'] = this.taskId;
    data['isDone'] = this.isDone;
    data['category'] = this.category;
    data['description'] = this.description;
    if (this.subtask != null) {
      data['subtask'] = this.subtask!.toJson();
    }
    return data;
  }
}

class Subtask {
  List<String>? tasks;
  List<bool>? taskCases;

  Subtask({this.tasks, this.taskCases});

  Subtask.fromJson(Map<String, dynamic> json) {
    tasks = json['tasks'].cast<String>();
    taskCases = json['taskCases'].cast<bool>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tasks'] = this.tasks;
    data['taskCases'] = this.taskCases;
    return data;
  }
}
