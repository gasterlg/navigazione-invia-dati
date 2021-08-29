import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task {
  final String titolo;
  final String descrizione;

  const Task(this.titolo, this.descrizione);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Passare dati',
      home: SchermataTask(
        tasks: List.generate(
          20,
          (i) => Task(
            'Task $i',
            'Descrizione per il task $i',
          ),
        ),
      ),
    ),
  );
}

class SchermataTask extends StatelessWidget {
  const SchermataTask({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elenco dei Task'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].titolo),

            // Quando l'utente preme il ListTile, naviga sulla SchermataDettaglio
            // Nota che non si sta solamente creando una SchermataDettaglio, ma si sta anche passando il task attuale.

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchermataDettaglio(task: tasks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SchermataDettaglio extends StatelessWidget {
  // Nel costruttore, richiede un task
  const SchermataDettaglio({Key? key, required this.task}) : super(key: key);

  // Dichiara un campo che contenga il Task
  final Task task;

  @override
  Widget build(BuildContext context) {
    // Utilizza il task per creare l'interfaccia Utente
    return Scaffold(
      appBar: AppBar(
        title: Text(task.titolo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(task.descrizione),
      ),
    );
  }
}
