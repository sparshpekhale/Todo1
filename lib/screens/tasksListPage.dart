import 'package:flutter/material.dart';

class TasksListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here\'s your tasks'),
      ),
      body: ListView(
        children: [
          TaskItem(1),
          TaskItem(2, Colors.blue),
        ],
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  static const _hPad = 8.0;
  static const _vPad = 4.0;
  final int _taskNum;

  final Color _clr;

  TaskItem(this._taskNum, [this._clr = Colors.white]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, _vPad, _hPad, _vPad),
          child: Text('Task $_taskNum'),
          color: _clr,
        ),
        IconButton(
          // onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          //     new SnackBar(content: Text('Task$_taskNum edit pressed'))),
          onPressed: () => Navigator.pushNamed(context, '/taskDetailsPage',
              arguments: {'taskId': _taskNum}),
          icon: Icon(Icons.edit),
        )
      ],
    );
  }
}
