import 'package:flutter/material.dart';
import 'screens/completed-screen.dart';
import 'screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(HappyTasks());
}

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
          '/completed': (context) => Completed(tasks: []),
        });
  }
}