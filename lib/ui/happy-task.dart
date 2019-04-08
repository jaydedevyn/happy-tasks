import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:happy_tasks/models/task.dart';

class HappyTask extends StatelessWidget {
  HappyTask({this.task, this.onTap});

  final Task task;
  final Function onTap;

  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: <Widget>[
          Flexible(
              child: ListTile(
            leading: CircleAvatar(
                child: FlareActor(
              'assets/star.flr',
              animation: 'go',
            )),
            title: Text(task.title, style: TextStyle(fontSize: 24.0)),
          ))
        ]),
        !task.isCompleted
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
