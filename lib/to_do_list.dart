import 'package:flutter/material.dart';
class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List toDoList = [];
  String _title = '';
  String _des = '';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("Line19");
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (e){
                        setState(() {
                          _title = e;
                        });
                      },
                    ),
                    TextField(
                      onChanged: (e){
                        setState(() {
                          _des = e;
                        });
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(

                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(14),
                      child: const Text("Back"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        toDoList.add({"title": _title, "desc": _des});
                        _title = '';
                        _des = '';
                      });
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(14),
                      child: const Text("Add To do"),
                    ),
                  ),
                ],
              );
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children:
            List.generate(toDoList.length, (index) {
              return Card(
                child: ListTile(
                  title: Text(toDoList[index]['title']),
                  subtitle: Text(toDoList[index]['desc']),
                ),
              );
      }
          ),
          ),
        ),  ),
    );
  }
}
