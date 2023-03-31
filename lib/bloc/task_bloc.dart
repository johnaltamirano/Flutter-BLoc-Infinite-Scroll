import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:infinite_scroll/models/task_model.dart';
import 'package:infinite_scroll/repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  TaskBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(TaskInitial()) {
    ///////
    on<getData>((event, emit) async {
      if (state is TaskInitial) {
        var tasks = await _taskRepository.connectToAPi(0, 10);
        emit(TaskLoaded(tasks: tasks, hasReachedMax: false));
      } else if (state is TaskLoaded) {
        TaskLoaded taskLoaded = state as TaskLoaded;
        var tasks =
            await _taskRepository.connectToAPi(taskLoaded.tasks.length, 10);

        emit((tasks.isEmpty)
            ? taskLoaded.copyWith(hasReachedMax: true)
            : TaskLoaded(
                tasks: taskLoaded.tasks + tasks, hasReachedMax: false));
      }
    });
    ////
  }
}
