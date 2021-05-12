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
  TimeOfDay _time;
  Task task;

  @override
  void initState() {
    task = StoredTasks.fetchById(widget._taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task details'),
      ),
      body: Column(
        children: [
          Text('{taskId-${task.taskId}}'),
          // Text(task.taskId.toString()),
          // Text(task.name),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: '${task.name}',
              onChanged: (newName) => _changeTaskName(newName, task.taskId),
              decoration: InputDecoration(
                hintText: '${'Enter name'}',
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
                // child: Text('${task.date.toLocal()}'.split(' ')[0]),
                child: printDate(task.date),
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
                        StoredTasks.changeDate(task.taskId, selectedDate);
                      });
                  })
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: printTime(task.time),
              ),
              IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () async {
                    final TimeOfDay selectedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    if (selectedTime != null && selectedTime != _time)
                      setState(() {
                        StoredTasks.changeTime(task.taskId, selectedTime);
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

  void _changeTaskName(String newName, int taskId) {
    StoredTasks.changeName(taskId, newName);
  }

  Text printDate(DateTime date) {
    if (date != null) {
      return Text('$date.toLocal()}'.split(' ')[0]);
    } else {
      return Text('Date not selected');
    }
  }

  Text printTime(TimeOfDay time) {
    if (time != null) {
      int len = time.toString().length;
      return Text('$time'.substring(len - 5, len - 1));
    } else {
      return Text('Time not selected');
    }
  }
}
