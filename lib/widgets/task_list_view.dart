import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/task_data.dart';
import 'package:taskly/widgets/task_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];
            return TaskTile(
              longPressCallBack: () {
                taskData.removeTask(task);
              },
              isChecked: task.isDone,
              newTaskText: task.name,
              checkBoxCallBack: (checkBoxState) {
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.countTask,
        );
      },
    );
  }
}
