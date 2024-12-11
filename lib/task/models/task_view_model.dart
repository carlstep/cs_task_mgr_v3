import 'package:cs_task_mgr_v3/task/models/task.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class TaskViewModel {
  TaskViewModel();

  // tasksNotifier - show all tasks
  final ValueNotifier<List<Task>> tasksNotifier = ValueNotifier([]);

  // show completed tasjs

  // add task function
  void addTask(
    String taskTitle,
    String? taskNote,
    DateTime taskDueDate,
  ) {
    tasksNotifier.value = [
      ...tasksNotifier.value,
      Task(
        id: const Uuid().v4(),
        taskTitle: taskTitle,
        isComplete: false,
        taskDueDate: taskDueDate,
        taskNote: taskNote,
      ),
    ];
    print('b - add new task process');
  }

  // remove task function
  void removeTask(Task task) {
    tasksNotifier.value =
        tasksNotifier.value.where((t) => t.id != task.id).toList();
  }

  // edit task function

  // toggle isComplete function

  void readAllTasks() {
    List<Task> allTasks = tasksNotifier.value.map((task) => task).toList();
    print(allTasks);
  }
}
