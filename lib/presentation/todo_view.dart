//Página responsável pela UI (User Interface), utiliza o BlocBuilder

import 'package:bloc_app/domain/models/todo.dart';
import 'package:bloc_app/presentation/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  //Mostra a caixa de diálogo (dialog box) para o usuário digitar
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [

          //Botão de Cancelar
          TextButton( 
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),

          //Botão de Adicionar
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Adicionar'),
          ),
        ]
      )
    );
  }

  //Builda a UI (User Interface)
  @override
  Widget build(BuildContext context) {

    //CUBIT ToDo
    final todoCubit = context.read<TodoCubit>();

    //SCAFFOLD
    return Scaffold(
      floatingActionButton: FloatingActionButton( //FAB = FLOATING ACTION BUTTON = BOTÃO DE AÇÃO FLUTUANTE
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),

      //BLOC BUILDER
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {

              //Pega ToDos individuais da lista
              final todo = todos[index];

              //LISTA ToDos
              return ListTile(

                //TEXTO
                title: Text(todo.text),

                //CHECKBOX
                leading: Checkbox(      
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                ),

                //BOTÃO DELETAR
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => todoCubit.deleteTodo(todo),
                ),
              );
            }
          );
        },
      ),
    );
  }
}