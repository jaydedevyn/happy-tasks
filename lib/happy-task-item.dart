import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:happy_tasks/models/happy-task.dart';

class HappyTaskItem extends StatelessWidget {
  HappyTaskItem({this.happyTask, this.onTap});

  final HappyTask happyTask;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      Row(children: <Widget>[
        Flexible(
            child: ListTile(
          leading: new CircleAvatar(
            backgroundColor: Colors.white30,
            child: FlareActor(
              'assets/star.flr',
              fit: BoxFit.contain,
              alignment: Alignment.center,
              animation: 'go',
            ),
          ),
          title: new Text(
            happyTask.title,
          ),
        ))
      ]),
      !happyTask.isCompleted
          ? RaisedButton(
              onPressed: onTap,
              child: Text('Complete'),
            )
          : Container()
    ]);
  }
}
