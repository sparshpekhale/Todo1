class Task {
  final int taskId;
  String name;
  DateTime date;

  Task(this.taskId, this.name, this.date);

  static Task fetchById(int taskId) {
    return taskList[taskId - 1];
  }

  static List<Task> fetchAllTitle() {
    return taskList;
  }

  static List<Task> taskList = [
    Task(1, 'This is task 1', DateTime.now()),
    Task(2, 'This is task 2', DateTime(2001)),
    Task(3, 'This is task 3', DateTime(2024))
  ];

  static bool changeDate(int taskId, DateTime date) {
    taskList[taskId - 1].date = date;
    return true;
  }
}
