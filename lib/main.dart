import 'package:flutter/material.dart';
import 'screens/completed-screen.dart';
import 'screens/home.dart';
void main() => runApp(HappyTasks());

class HappyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          '/completed': (context) => Completed(),
        });
  }
}