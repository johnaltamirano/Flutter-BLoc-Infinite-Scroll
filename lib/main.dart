import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_scroll/bloc/task_bloc.dart';
import 'package:infinite_scroll/repository/task_repository.dart';

import 'package:infinite_scroll/ui/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: RepositoryProvider(
        create: (context) => TaskRepository(),
        child: BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(
              taskRepository: RepositoryProvider.of<TaskRepository>(context))
            ..add(getData()),
          child: MainScreen(),
        ),
      ),
    );
  }
}
