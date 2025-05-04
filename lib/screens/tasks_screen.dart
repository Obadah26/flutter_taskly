import 'package:flutter/material.dart';
import 'package:taskly/screens/add_task_screen.dart';
import 'package:taskly/widgets/task_list_view.dart';
import 'package:provider/provider.dart';
import 'package:taskly/task_data.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade700,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () async {
          await showModalBottomSheet<String>(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder:
                (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(),
                ),
          );
        },
        shape: CircleBorder(),
        elevation: 5,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton(
                  onPressed: null,
                  backgroundColor: Colors.white,
                  elevation: 5,
                  shape: const CircleBorder(),
                  child: Icon(Icons.menu, color: Colors.cyan.shade700),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Taskly',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      '${Provider.of<TaskData>(context).countTask} Tasks',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan.shade700,
                      ),
                    ),
                  ),
                  Expanded(child: TaskListView()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
