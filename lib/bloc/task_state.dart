part of 'task_bloc.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  final bool hasReachedMax;
  TaskLoaded({required this.tasks, required this.hasReachedMax});

  TaskLoaded copyWith({
    List<Task>? tasks,
    bool? hasReachedMax,
  }) =>
      TaskLoaded(
        tasks: tasks ?? this.tasks,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );
}
