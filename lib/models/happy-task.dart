class HappyTask {
  String id;
  String title;
  bool isCompleted;

  HappyTask({this.id, this.title, this.isCompleted = false});
  
  factory HappyTask.fromJson(Map<String, dynamic> parsedJson)
    => HappyTask(
      id: parsedJson['id'],
      title: parsedJson['title'],
      isCompleted : parsedJson ['isCompleted']
    );
}