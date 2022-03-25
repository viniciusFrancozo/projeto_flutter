import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/tarefa.dart';

void main() {
  runApp(ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = <Tarefa>[];

  TextEditingController controller = TextEditingController();
  void adicionaTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
    });
    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(
                tarefa.concluido
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Colors.green),
            onPressed: () {
              setState(() {
                if (tarefa.concluido == false) {
                  tarefa.concluido = true;
                } else {
                  tarefa.concluido = false;
                }
              });
            },
            padding: EdgeInsets.only(left: 10, right: 30),
            iconSize: 42),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tarefa.nome,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(tarefa.data.toIso8601String()) //Intl
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lista de Tarefas")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                  controller: controller, onSubmitted: adicionaTarefa),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (_, indice) {
                return getItem(tarefas[indice]);
              },
            ))
          ],
        ));
  }
}
