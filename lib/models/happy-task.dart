class HappyTask {
  String id;
  String title;
  String icon;
  bool isCompleted = false;

  HappyTask({this.id, this.title, this.icon, this.isCompleted = false});

  factory HappyTask.fromJson(Map<String, dynamic> parsedJson)
    => HappyTask(
      id: parsedJson['id'],
      title: parsedJson['title'],
      icon : parsedJson['icon'],
      isCompleted : parsedJson ['isCompleted']
    );
  
}