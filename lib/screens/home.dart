import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happy_tasks/happy-task-item.dart';
import 'package:happy_tasks/models/happy-task.dart';
import 'package:happy_tasks/screens/completed-screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, HappyTask> completedTasks = {};
  Map<String, HappyTask> skippedTasks = {};
  bool _loading = false;
  HappyTask currentTask = new HappyTask();

  void _toggleLoading() => setState(() => _loading = !_loading);

  void _getHappyTask() async {
    _toggleLoading();
    if (!currentTask.isCompleted) {
      skippedTasks[currentTask.id] = currentTask;
    }
    QuerySnapshot fireStoreDocs =
        await Firestore.instance.collection('happyTasks').getDocuments();
    _toggleLoading();
    final newDoc = fireStoreDocs.documents.firstWhere((doc) =>
        completedTasks[doc.data['id']] == null &&
        skippedTasks[doc.data['id']] == null);

    setState(() => currentTask = HappyTask.fromJson(newDoc.data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HappyTasks'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.done),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompletedScreen(
                        happyTasks: completedTasks.values.toList()))),
          ),
        ],
      ),

      backgroundColor: Colors.lightGreen,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            currentTask.id == null
                ? Text(
                    'Click to add a happyTask',
                  )
                : Container(),
            currentTask.id != null
                ? HappyTaskItem(
                    happyTask: currentTask,
                    onTap: () {
                      setState(() {
                        currentTask.isCompleted = true;
                        completedTasks[currentTask.id] = currentTask;
                      });

                      _getHappyTask();
                    })
                : Container(),
            SizedBox(
              height: 120.0,
            ),
            Text(
                'Number of happyTasks completed: ${completedTasks.values.where((task) => task.isCompleted).length}'),
          ])),
      // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getHappyTask,
        icon: _loading
            ? Container(
                height: 12.0,
                width: 12.0,
                child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.white)))
            : Icon(Icons.add),
        label: Text('New Task', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
