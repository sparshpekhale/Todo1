import 'package:flutter/material.dart';
import 'screens/tasksListPage.dart';
import 'screens/taskDetailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: TasksListPage(),
      // home: TaskDetails(1),
      onGenerateRoute: _routes(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> args = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case '/':
          screen = TasksListPage();
          break;
        case '/taskDetailsPage':
          screen = TaskDetailsPage(args['taskId']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
