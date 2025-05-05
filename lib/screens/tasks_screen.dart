import 'package:flutter/material.dart';
import 'package:taskly/screens/add_task_screen.dart';
import 'package:taskly/widgets/task_list_view.dart';
import 'package:provider/provider.dart';
import 'package:taskly/task_data.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade700,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
            height: 232,
            width: 540,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton(
                  // Menu Button
                  onPressed: null,
                  backgroundColor: Colors.white,
                  elevation: 5,
                  shape: const CircleBorder(),
                  child: Icon(Icons.menu, color: Colors.cyan.shade700),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Taskly',
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(1, 1),
                      ),
                    ],
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
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 100,
                          top: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Task Title',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Colors.cyan.shade700,
                                fontFamily: 'Winky Rough',
                              ),
                            ),
                            const SizedBox(width: 80),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                        child: Text(
                          '${Provider.of<TaskData>(context).countTask} Tasks',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.cyan.shade900,
                            fontFamily: 'Winky Rough',
                          ),
                        ),
                      ),
                      Expanded(child: TaskListView()),
                    ],
                  ),
                  Positioned(
                    // Progress Circular
                    top: 20,
                    right: 20,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: DashedCircularProgressBar.aspectRatio(
                        aspectRatio: 1,
                        valueNotifier: _valueNotifier,
                        progress:
                            Tween<double>(
                                  begin: 0,
                                  end:
                                      Provider.of<TaskData>(
                                        context,
                                      ).completionPercentage,
                                )
                                .animate(
                                  CurvedAnimation(
                                    parent: AlwaysStoppedAnimation(1),
                                    curve: Curves.easeInOut,
                                  ),
                                )
                                .value,
                        startAngle: 0,
                        sweepAngle: 360,
                        foregroundColor: Colors.cyan.shade700,
                        backgroundColor: const Color(0xffeeeeee),
                        foregroundStrokeWidth: 10,
                        backgroundStrokeWidth: 10,
                        animation: true,
                        seekSize: 6,
                        seekColor: Colors.cyan.shade700,
                        child: Center(
                          child: ValueListenableBuilder(
                            valueListenable: _valueNotifier,
                            builder:
                                (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${value.toInt()}%',
                                      style: const TextStyle(
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // Add task Button
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: Colors.cyan.shade700,
                      onPressed: () async {
                        await showModalBottomSheet<String>(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder:
                              (context) => SingleChildScrollView(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: AddTaskScreen(),
                              ),
                        );
                      },
                      shape: StarBorder(),
                      elevation: 5,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
