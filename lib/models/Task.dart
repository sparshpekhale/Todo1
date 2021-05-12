import 'package:flutter/material.dart';
import 'package:todo1/screens/tasksListPage.dart';

class Task {
  int taskId;
  String name;
  DateTime date;
  TimeOfDay time;

  Task(this.taskId, this.name);
}

class StoredTasks {
  static List<Task> taskList = [
    Task(1, 'This is task 1'),
    Task(2, 'This is task 2'),
    Task(3, 'This is task 3')
  ];

  static int addTask() {
    int newId;
    if (taskList.length == 0) {
      newId = 1;
    } else {
      newId = taskList[taskList.length - 1].taskId + 1;
    }
    taskList.add(Task(newId, 'This is new task'));
    return newId;
  }

  static bool deleteTask(int idToDel) {
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].taskId == idToDel) {
        taskList.removeAt(i);
        return true;
      }
    }
    return false;
  }

  static bool changeName(int taskId, String newName) {
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].taskId == taskId) {
        taskList[i].name = newName;
        return true;
      }
    }
    return false;
  }

  static Task fetchById(int taskId) {
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].taskId == taskId) {
        return taskList[i];
      }
    }
    // return taskList[taskId - 1];
  }

  static List<Task> fetchAllTitle() {
    return taskList;
  }

  static bool changeDate(int taskId, DateTime date) {
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].taskId == taskId) {
        taskList[i].date = date;
        return true;
      }
    }
    return false;
    // taskList[taskId - 1].date = date;
    // return true;
  }

  static bool changeTime(int taskId, TimeOfDay time) {
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].taskId == taskId) {
        taskList[i].time = time;
        return true;
      }
    }
    return false;
    // taskList[taskId - 1].time = time;
    // return true;
  }
}
