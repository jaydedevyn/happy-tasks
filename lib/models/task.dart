class Task {
  String id;
  String title;
  bool isCompleted;
  Task({this.id, this.title, this.isCompleted = false});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted']);
}