class Task {
  String id;
  String title;
  bool isCompleted;

  Task({this.id, this.title, this.isCompleted = false});

  factory Task.fromJson(Map<String, dynamic> parsedJson)
    => Task(
      id: parsedJson['id'],
      title: parsedJson['title'],
      isCompleted : parsedJson ['isCompleted']
    );
}