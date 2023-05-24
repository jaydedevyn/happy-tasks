import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../ui/happy-task.dart';
import 'completed-screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, Task> completed = {};
  Map<String, Task> skipped = {};
  bool _loading = false;
  bool _showConfetti = false;
  Task currentTask = new Task();

  _toggleLoading() => setState(() => _loading = !_loading);

  _toggleConfetti() => setState(() => _showConfetti = !_showConfetti);

  void _getHappyTask() {
    _toggleLoading();
    if (!currentTask.isCompleted) skipped[currentTask.id] = currentTask;

    FirebaseFirestore.instance.collection('happyTasks').get().then((snapshot) {
      _toggleLoading();
      final res = snapshot.docs.firstWhere(
              (doc) {
            return (!completed.containsKey((doc.data())['id']) &&
                !skipped.containsKey((doc.data())['id']));
          }

      );

      if (res != null) setState(() => currentTask = Task.fromJson(res.data()));
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(title: Text('HappyTasks'), actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Completed(tasks: completed.values.toList()))),
            )
          ]),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: _showConfetti ? 200.0 : 0.0,
                child: FlareActor(
                  'assets/confetti.flr',
                  animation: 'go',
                )),
            currentTask.id != null
                ? HappyTask(
                task: currentTask,
                onTap: () {
                  _toggleConfetti();
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      currentTask.isCompleted = true;
                      completed[currentTask.id] = currentTask;
                    });
                    _toggleConfetti();
                    _getHappyTask();
                  });
                })
                : Container()
          ]),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _getHappyTask,
            icon: _loading
                ? Container(
                height: 12.0,
                width: 12.0,
                child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation(Colors.black)))
                : Icon(Icons.add),
            label: Text('New Task'),
          ));
}
