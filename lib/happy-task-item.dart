import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:happy_tasks/models/happy-task.dart';

class HappyTaskItem extends StatelessWidget {
  HappyTaskItem({this.happyTask, this.onTap});

  final HappyTask happyTask;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: <Widget>[
        Flexible(
            child: ListTile(
          leading: CircleAvatar(
            child: FlareActor(
              'assets/star.flr',
              animation: 'go',
            ),
          ),
          title: Text(happyTask.title, style: TextStyle(fontSize: 24.0)),
        ))
      ]),
      !happyTask.isCompleted
          ? RaisedButton(
              onPressed: onTap,
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text('Complete'),
            )
          : Container()
    ]);
  }
}
