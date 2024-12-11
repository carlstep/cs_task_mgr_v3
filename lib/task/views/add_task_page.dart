import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  final Function(String, String, DateTime) onAddTask;

  const AddTaskPage({
    super.key,
    required this.onAddTask,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskNoteController = TextEditingController();

  DateTime _taskDueDate = DateTime.now();

  @override
  void dispose() {
    _taskTitleController.dispose();
    _taskNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _taskTitleController,
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _taskNoteController,
                decoration:
                    const InputDecoration(labelText: 'task information'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter task information';
                  }
                  return null;
                },
                minLines: 1,
                maxLines: null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    DateFormat('EEEE, d MMMM yyyy').format(_taskDueDate),
                  ),
                  const Expanded(child: SizedBox(width: 10)),
                  IconButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _taskDueDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() {
                          _taskDueDate = date;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              const Expanded(child: SizedBox(height: 16)),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onAddTask(
                      _taskTitleController.text,
                      _taskNoteController.text,
                      _taskDueDate,
                    );

                    // _taskTitleController.clear();
                    // _taskNoteController.clear();

                    Navigator.pop(context); // Go back to previous screen
                  }
                },
                child: const Text('Add Task'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
