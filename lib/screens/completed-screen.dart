import 'package:flutter/material.dart';
import 'package:happy_tasks/happy-task-item.dart';
import 'package:happy_tasks/models/happy-task.dart';

class CompletedScreen extends StatefulWidget {
  CompletedScreen({this.happyTasks});

  final List<HappyTask> happyTasks;
  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Completed')),
        body: ListView(
          children: widget.happyTasks
              .map((task) => HappyTaskItem(happyTask: task))
              .toList(),
        ));
  }
}
