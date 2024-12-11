import 'package:cs_task_mgr_v3/task/models/task_view_model.dart';
import 'package:cs_task_mgr_v3/task/views/widgets/task_card.dart';
import 'package:flutter/material.dart';

class InboxView extends StatefulWidget {
  final TaskViewModel taskViewModel;
  final String viewTitle;

  const InboxView({
    super.key,
    required this.viewTitle,
    required this.taskViewModel,
  });

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  // final TaskViewModel _taskViewModel = TaskViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: widget.taskViewModel.tasksNotifier,
        builder: (context, tasks, child) => ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskCard(task: task, widget: widget);
            }),
      ),
    );
  }
}
