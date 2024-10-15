import 'package:isar/isar.dart';
import 'package:bloc_app/domain/models/todo.dart';

//ISAR ToDo MODEL -> converte o modelo ToDo em um modelo ISAR ToDo para guardar as infos no BD ISAR

//para gerar objeto ToDo ISAR, no terminal use: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //converte objeto ISAR -> objeto ToDo puro para uso no app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  //converte objeto ToDo puro -> objeto isar para guardar no BD ISAR
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
    ..id = todo.id
    ..text = todo.text
    ..isCompleted = todo.isCompleted;
  }
}