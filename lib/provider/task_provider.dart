import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Response;

import 'package:infinite_scroll/models/task_model.dart';

class TaskProvider {
  TaskProvider();

  String urlbase = "jsonplaceholder.typicode.com";

  Future<List<Task>> connectToAPi(int start, int limit) async {
    var url = Uri.https(urlbase, 'posts',
        {"_start": start.toString(), "_limit": limit.toString()});
    Response response = await http.get(url);
    List data = json.decode(response.body);
    List<Task> list = data.map((item) => Task.fromMap(item)).toList();
    return list;
  }
}
