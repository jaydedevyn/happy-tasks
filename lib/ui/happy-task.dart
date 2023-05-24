import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class HappyTask extends StatelessWidget {
  HappyTask({required this.task, required this.onTap});
  final Task task;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
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
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text(!task.isCompleted ? 'Complete' : ''),
        )
      ]);
}
