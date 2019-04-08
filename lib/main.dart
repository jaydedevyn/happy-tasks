import 'package:flutter/material.dart';
import 'package:happy_tasks/screens/completed-screen.dart';
import 'package:happy_tasks/screens/home.dart';
void main() => runApp(HappyTasks());

class HappyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext con5text) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomeScreen(),
       routes: <String, WidgetBuilder>{
            '/completed': (BuildContext context) => CompletedScreen(),
          }
    );
  }
}
