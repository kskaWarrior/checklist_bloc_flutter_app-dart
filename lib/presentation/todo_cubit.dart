import 'package:bloc_app/domain/models/todo.dart';
import 'package:bloc_app/domain/repository/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoCubit extends Cubit<List<Todo>> {
  //referencia o repositório
  final TodoRepo todoRepo;

  //construtor inicializa o cubit com uma lista vazia
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }


  //CARREGA
  Future<void> loadTodos() async {
    //busca lista de ToDos do repositório
    final todoList = await todoRepo.getTodos();

    //emite a lista buscada como um novo estado -> esse é o propósito de uso do BloC
    emit (todoList);
  }


  //ADICIONA
  Future<void> addTodo(String text) async {

    //cria novo ToDo com ID único sendo o horário atual da operação em milissegundos
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    //salva novo ToDo no repositório
    await todoRepo.addTodo(newTodo);

    //recarrega
    loadTodos();
  }


  //DELETA
  Future<void> deleteTodo(Todo todo) async {

    //deleta o ToDo provido do repositório
    await todoRepo.deleteTodo(todo);

    //recarrega
    loadTodos();
  }


  //ALTERNA O STATUS CHECK
  Future<void> toggleCompletion(Todo todo) async{

    //alterna a conclusão do status do ToDo provido
    final updatedTodo = todo.toggleCompletion();
 
    //atualiza o ToDo no repositório com a nova conclusão do status
    await todoRepo.updateTodo(updatedTodo);

    //recarrega
    loadTodos();
  }
}