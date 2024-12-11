import 'package:cs_task_mgr_v3/task/models/task_view_model.dart';
import 'package:cs_task_mgr_v3/task/views/add_task_page.dart';
import 'package:cs_task_mgr_v3/task/views/inbox_view.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 1;
  final TaskViewModel _taskViewModel = TaskViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // appBar title should update with the viewTitle
        title: Text('-- viewTitle --'),
        actions: [
          // when pressed, the AddTaskPage shows
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskPage(
                    onAddTask: (taskTitle, taskNote, taskDueDate) {
                      _taskViewModel.addTask(taskTitle, taskNote, taskDueDate);
                    },
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.blueGrey.shade200,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'focus list',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'inbox list',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'stats',
          ),
        ],
      ),
      body: [
        Text('FocusView'),
        InboxView(
          viewTitle: 'Inbox View',
          taskViewModel: _taskViewModel,
        ),
        Text('StatsView'),
      ][currentPageIndex],
    );
  }
}
