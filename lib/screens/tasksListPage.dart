import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo1/models/Task.dart';

class TasksListPage extends StatefulWidget {
  @override
  _TasksListPageState createState() => _TasksListPageState();
}

class _TasksListPageState extends State<TasksListPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = StoredTasks.fetchAllTitle();

    return Scaffold(
      appBar: AppBar(
        title: Text('Here\'s your tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => _itemBuilder(context, tasks[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTask(context),
        // onPressed: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(new SnackBar(content: Text('button pressed'))),
      ),
      // body: ListView(
      //   children: [
      //     TaskItem(1),
      //     TaskItem(2, Colors.blue),
      //   ],
      // ),
    );
  }

  Widget _itemBuilder(BuildContext context, Task task) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      closeOnScroll: true,
      child: TaskItem(task.taskId),
      actions: [
        IconSlideAction(
          color: Colors.red[600],
          icon: Icons.delete,
          onTap: () => _deleteTask(context, task.taskId),
        ),
      ],
    );
  }

  void _deleteTask(BuildContext context, int taskId) {
    setState(() {
      StoredTasks.deleteTask(taskId);
    });
  }

  void _addNewTask(BuildContext context) {
    setState(() {
      int newId = StoredTasks.addTask();
      Navigator.pushNamed(context, '/taskDetailsPage',
          arguments: {'taskId': newId});
    });
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
    return ListTile(
      leading: Text('${StoredTasks.fetchById(_taskNum).name}'),
      trailing: IconButton(
        onPressed: () => Navigator.pushNamed(context, '/taskDetailsPage',
            arguments: {'taskId': _taskNum}),
        icon: Icon(Icons.edit),
      ),
    );

    // return Row(
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.fromLTRB(_hPad, _vPad, _hPad, _vPad),
    //       child: Text('${StoredTasks.fetchById(_taskNum).name}'),
    //       color: _clr,
    //     ),
    // IconButton(
    //   // onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
    //   //     new SnackBar(content: Text('Task$_taskNum edit pressed'))),
    //   onPressed: () => Navigator.pushNamed(context, '/taskDetailsPage',
    //       arguments: {'taskId': _taskNum}),
    //   icon: Icon(Icons.edit),
    // )
    //   ],
    // );
  }
}
