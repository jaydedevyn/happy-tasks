import 'package:flutter/material.dart';
import '../ui/happy-task.dart';
import '../models/task.dart';

class CompletedScreen extends StatefulWidget {
  CompletedScreen({this.tasks});

  final List<Task> tasks;
  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Completed')),
      body: ListView(
        children: widget.tasks
            .map((task) => HappyTask(task: task))
            .toList()
      ));
}
