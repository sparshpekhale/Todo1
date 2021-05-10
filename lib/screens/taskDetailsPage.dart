import 'package:flutter/material.dart';
import 'package:todo1/models/Task.dart';

class TaskDetailsPage extends StatefulWidget {
  final int _taskId;

  TaskDetailsPage(this._taskId);

  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  DateTime _date;
  Task task;

  @override
  void initState() {
    task = Task.fetchById(widget._taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task details'),
      ),
      body: Column(
        children: [
          Text('${task.date}'),
          // Text(task.taskId.toString()),
          // Text(task.name),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${task.date.toLocal()}'.split(' ')[0]),
              ),
              IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () async {
                    final DateTime selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2024),
                    );
                    if (selectedDate != null && selectedDate != _date)
                      setState(() {
                        // _date = selectedDate;
                        Task.changeDate(task.taskId, selectedDate);
                      });
                  })
            ],
          )

          // TextField(
          //     readOnly: true,
          //     decoration: InputDecoration(
          //       labelText: 'Date',
          //       hintText: "${_date.toLocal()}".split(' ')[0],
          //     ),
          //     onTap: () async {
          //       final DateTime selectedDate = await showDatePicker(
          //           context: context,
          //           initialDate: DateTime.now(),
          //           firstDate: DateTime(2001),
          //           lastDate: DateTime(2024));
          //       if (selectedDate != null && selectedDate != _date)
          //         setState(() {
          //           _date = selectedDate;
          //         });
          //     })
        ],
      ),
    );
  }
}
