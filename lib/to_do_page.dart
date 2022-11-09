import 'package:flutter/material.dart';
import 'package:to_do_list_practice/second_to_do_page.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List toDoList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
           // setState(() {});
            var data = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SecondToDoList()));
            setState(() {
              toDoList.add(data);
            });
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: List.generate(toDoList.length, (index) {
            return Card(
              child: ListTile(
                title: Text(toDoList[index]['name']),
                subtitle: Text(toDoList[index]['address']),
              ),
            );
          })),
        ),
      ),
    );
  }
}
