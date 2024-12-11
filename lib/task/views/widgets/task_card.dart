import 'package:cs_task_mgr_v3/task/models/task.dart';
import 'package:cs_task_mgr_v3/task/views/inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.widget,
  });

  final Task task;
  final InboxView widget;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            widget.task.taskTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            DateFormat('dd MMM yyyy').format(widget.task.taskDueDate),
          ),
        ],
      ),
      subtitle: Text(
        widget.task.taskNote ?? '',
        maxLines: null,
        overflow: isSelected ? TextOverflow.ellipsis : null,
      ),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      // onLongPress: () {
      //   widget.widget.taskViewModel.removeTask(widget.task);
      // },
    );
  }
}
