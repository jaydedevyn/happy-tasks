import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:happy_tasks/ui/happy-task.dart';
import 'package:happy_tasks/models/task.dart';
import 'package:happy_tasks/screens/completed-screen.dart';

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

  void _toggleLoading() => setState(() => _loading = !_loading);
  void _toggleConfetti() => setState(() => _showConfetti = !_showConfetti);

  void _getHappyTask() async {
    _toggleLoading();
    if (!currentTask.isCompleted) {
      skipped[currentTask.id] = currentTask;
    }
    QuerySnapshot fireDocs =
        await Firestore.instance.collection('happyTasks').getDocuments();
    _toggleLoading();
    final newDoc = fireDocs.documents.firstWhere((doc) =>
        completed[doc.data['id']] == null && skipped[doc.data['id']] == null);

    setState(() => currentTask = Task.fromJson(newDoc.data));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('HappyTasks'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompletedScreen(
                        tasks: completed.values.toList()))),
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _showConfetti
                ? Container(
                    height: 200.0,
                    width: 200.0,
                    child: FlareActor(
                      'assets/confetti.flr',
                      animation: 'go',
                    ))
                : Container(),
            currentTask.id != null
                ? HappyTask(
                    task: currentTask,
                    onTap: () {
                      _toggleConfetti();
                      Future.delayed(Duration(milliseconds: 1500), () {
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black)))
            : Icon(Icons.add),
        label: Text('New Task'),
      ));
}
