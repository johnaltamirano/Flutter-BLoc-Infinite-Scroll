import 'package:flutter/material.dart';
import 'package:infinite_scroll/bloc/task_bloc.dart';
import 'package:infinite_scroll/models/task_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll/repository/task_repository.dart';
import 'package:infinite_scroll/ui/task_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController controller = ScrollController();
  void onScroll() {
    double maxScoll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScoll) context.read<TaskBloc>().add(getData());
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Infinite Scroll"),
        centerTitle: true,
      ),
      body: Container(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskInitial) {
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              TaskLoaded taskLoaded = state as TaskLoaded;

              return ListView.builder(
                controller: controller,
                itemCount: (taskLoaded.hasReachedMax)
                    ? taskLoaded.tasks.length
                    : taskLoaded.tasks.length + 1,
                itemBuilder: (context, index) {
                  if (index < taskLoaded.tasks.length) {
                    Task task = taskLoaded.tasks[index];
                    return TaskItem(task: task);
                  } else {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
