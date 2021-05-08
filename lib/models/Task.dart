class Task {
  final int taskId;
  String name;

  Task(this.taskId, this.name);

  static Task fetchById(int taskId) {
    return taskList[taskId - 1];
  }

  static List<Task> taskList = [
    Task(1, 'This is task 1'),
    Task(2, 'This is task 2'),
    Task(3, 'This is task 3')
  ];
}
