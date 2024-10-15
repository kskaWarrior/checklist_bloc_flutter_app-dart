import 'package:bloc_app/domain/repository/todo_repo.dart';
import 'package:bloc_app/presentation/todo_cubit.dart';
import 'package:bloc_app/presentation/todo_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Provê visualização do cubit (UI, User Interface), utiliza o BlocProvider

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;

  const TodoPage ({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}