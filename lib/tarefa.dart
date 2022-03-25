class Tarefa {
  late String nome;
  late DateTime data;
  late bool concluido;

  Tarefa(this.nome) {
    data = DateTime.now();
    concluido = false;
  }
}
