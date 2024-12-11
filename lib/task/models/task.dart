class Task {
  final String id;
  final String taskTitle;
  final bool isComplete;
  final String? taskNote;
  final DateTime taskDueDate;

  Task({
    required this.id,
    required this.taskTitle,
    required this.isComplete,
    this.taskNote,
    required this.taskDueDate,
  });

  Task copyWith({
    String? id,
    String? taskTitle,
    bool? isComplete,
    String? taskNote,
    DateTime? taskDueDate,
  }) {
    return Task(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      isComplete: isComplete ?? this.isComplete,
      taskNote: taskNote ?? this.taskNote,
      taskDueDate: taskDueDate ?? this.taskDueDate,
    );
  }
}
