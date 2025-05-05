import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.newTaskText,
    required this.checkBoxCallBack,
    required this.longPressCallBack,
  });

  final bool? isChecked;
  final String newTaskText;
  final void Function(bool?)? checkBoxCallBack;
  final void Function() longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        newTaskText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          decoration: isChecked == true ? TextDecoration.lineThrough : null,
          fontFamily: 'Winky Rough',
        ),
      ),
      leading: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: isChecked,
          onChanged: checkBoxCallBack,
          activeColor: Colors.cyan,
        ),
      ),
    );
  }
}
