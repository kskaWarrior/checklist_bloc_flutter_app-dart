import 'package:bloc_app/data/models/isar_todo.dart';
import 'package:bloc_app/data/repository/isar_todo_repo.dart';
import 'package:bloc_app/domain/repository/todo_repo.dart';
import 'package:bloc_app/presentation/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Pega o caminho do diretório para armazenar informação
  final dir = await getApplicationDocumentsDirectory();

  //Abre o BD ISAR
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  //Inicializa o repositório com o BD ISAR
  final isarTodoRepo = IsarTodoRepo(isar);

  //RODA O APP
  runApp(MyApp(todoRepo: isarTodoRepo));
}


//INTERFACE DE USUÁRIO (UI):

class MyApp extends StatelessWidget {

  //INJEÇÃO DE DEPENDÊNCIAS PELO APP
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}