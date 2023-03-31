import 'package:flutter/material.dart';
import 'package:infinite_scroll/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: SizedBox(
            width: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(task.id.toString())],
            ),
          ),
          title: Text(task.title),
          subtitle: Text(task.body),
        ),
      ),
    );
  }
}
