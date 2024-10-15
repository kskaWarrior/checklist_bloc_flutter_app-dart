//MODELO
class Todo {
  final int id;
  final String text;
  final bool isCompleted;

//PROPRIEDADES
  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

//COMPORTAMENTO DE RETORNO -> ao dar ou desfazer o "check" no item, ele altera o valor de isCompleted e deve ser atualizado com o novo valor
  Todo toggleCompletion() {
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted, // "!" = retorna o contrário do valor que estava (sendo uma var boolean, alternando entre true e false)
    );
  }
}

