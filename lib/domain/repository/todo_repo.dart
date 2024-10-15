import 'package:bloc_app/domain/models/todo.dart';

//REPOSITÓRIO ToDo

abstract class TodoRepo {

  Future<List<Todo>> getTodos(); //pega uma lista de ToDo's

  Future<void> addTodo(Todo newTodo); //adiciona novo ToDo

  Future<void> updateTodo(Todo todo); //atualiza um ToDo existente

  Future<void> deleteTodo(Todo todo); //deleta um ToDo
}

//o repositório na camada de domínio marca quais operações o app pode fazer,
//mas sem se preocupar com os detalhes de implementação específicos. Isso é para a camada de Dados.

//tudo na camada de domínio deve ser agnóstico a tecnologias: sistema funcional independente do framework e replicável para qualquer outro.