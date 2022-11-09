

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToDoListPractice extends StatefulWidget {
  const ToDoListPractice({Key? key}) : super(key: key);

  @override
  State<ToDoListPractice> createState() => _ToDoListPracticeState();
}

class _ToDoListPracticeState extends State<ToDoListPractice> {
  List toDoList = [];
  String adress = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("To Do List"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: Center(child: Text("Add Task")),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                              decoration: InputDecoration(
                                hintText: "Name",
                              ),
                              onChanged: (i) {
                                setState(() {
                                  name = i;
                                });
                              }),
                          TextField(
                              decoration: InputDecoration(hintText: "Adress"),
                              onChanged: (i) {
                                setState(() {
                                  adress = i;

                                });
                              }),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {

                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              child: Text("Back"),
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  toDoList.add({"Name": name, "Adress": adress});
                                  name = "";
                                  adress = "";
                                });
                              });
                              Navigator.of(context).pop();
                              Fluttertoast.showToast(msg: "Added Successfully");
                            },

                              child: Container(
                                child: Text("Add to do"),
                              ),
                            ),
                      ],
                    );
                  });
            },
            child: Icon(Icons.add),
          ),
          body: Column(
            children: List.generate(toDoList.length, (index) {
              return Card(
                child: ListTile(
                  title: Text("Name: ${toDoList[index]["Name"]}"),
                  subtitle: Text("Adress : ${toDoList[index]["Adress"]}"),
                  trailing: InkWell(
                    onTap: (){
                     Fluttertoast.showToast(msg: "Successfully Deleted");
                    setState(() {
                      toDoList.removeAt(index);
                    });
                    },
                      child: Icon(Icons.delete)),
                  leading: Icon(Icons.person),
                ),
              );
            }),
          )),
    );
  }
}
