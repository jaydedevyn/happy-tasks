import 'package:flutter/material.dart';
import 'screens/completed-screen.dart';
import 'screens/home.dart';

void main() => runApp(HappyTasks());

class HappyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          '/completed': (context) => CompletedScreen(),
        });
  }
}