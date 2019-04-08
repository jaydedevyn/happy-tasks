import 'package:flutter/material.dart';
import '../ui/happy-task.dart';
import '../models/task.dart';

class Completed extends StatefulWidget {
  Completed({this.tasks});

  final List<Task> tasks;
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Completed')),
      body: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: ListView(
              children:
                  widget.tasks.map((task) => HappyTask(task: task)).toList())));
}
