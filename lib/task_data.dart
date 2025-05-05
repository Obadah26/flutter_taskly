import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:taskly/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get countTask {
    return _tasks.length;
  }

  void addTask(String newTasktitle) {
    final task = Task(name: newTasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  int get completedTaskCount {
    return _tasks.where((task) => task.isDone).length;
  }

  double get completionPercentage {
    if (_tasks.isEmpty) return 0.0;
    return (completedTaskCount / _tasks.length) * 100;
  }
}
