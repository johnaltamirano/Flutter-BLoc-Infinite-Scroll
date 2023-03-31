import 'package:infinite_scroll/models/task_model.dart';
import 'package:infinite_scroll/provider/task_provider.dart';

class TaskRepository {
  TaskProvider taskProvider = TaskProvider();

  Future<List<Task>> connectToAPi(int start, int limit) => taskProvider.connectToAPi(start, limit);
}
