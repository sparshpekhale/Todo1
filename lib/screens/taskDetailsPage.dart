import 'package:flutter/material.dart';
import 'package:todo1/models/Task.dart';

class TaskDetailsPage extends StatelessWidget {
  final int _taskId;

  TaskDetailsPage(this._taskId);

  @override
  Widget build(BuildContext context) {
    final task = Task.fetchById(_taskId);

    return Scaffold(
        appBar: AppBar(
          title: Text('Task details'),
        ),
        body: Column(
          children: [
            Text(task.taskId.toString()),
            Text(task.name),
          ],
        ));
  }
}
