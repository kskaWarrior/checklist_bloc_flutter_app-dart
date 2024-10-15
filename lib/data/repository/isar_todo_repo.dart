import 'package:bloc_app/data/models/isar_todo.dart';
import 'package:bloc_app/domain/models/todo.dart';
import 'package:bloc_app/domain/repository/todo_repo.dart';
import 'package:isar/isar.dart';

//Repositório de DB -> implemente o repositório de ToDos e lida com guardar, buscar, atualizar e deletar informações no BD ISAR

class IsarTodoRepo implements TodoRepo{
  
  //BD - BASE DE DADOS
  final Isar db;
  IsarTodoRepo(this.db);

  //busca os ToDos
  @override
  Future<List<Todo>> getTodos()async {
    final todos = await db.todoIsars.where().findAll();

    //retorna uma lista de ToDos e entrega para a camada de domínio
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }
  
  //adiciona novo ToDo
  @override
  Future<void> addTodo(Todo newTodo) {
    //converte o "ToDo" em um "ISAR ToDo"
    final todoIsar = TodoIsar.fromDomain(newTodo);

    //agora podemos guardar a info no BD ISAR
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
  
  //atualiza um ToDo existente
  @override
  Future<void> updateTodo(Todo todo) {
    //converte o "ToDo" em um "ISAR ToDo"
    final todoIsar = TodoIsar.fromDomain(todo);

    //agora podemos guardar a info no BD ISAR
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //deleta um ToDo
  @override
  Future<void> deleteTodo(Todo todo) async {
    //converte o "ToDo" em um "ISAR ToDo"
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}