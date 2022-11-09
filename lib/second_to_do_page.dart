

import 'package:flutter/material.dart';
import 'package:to_do_list_practice/to_do_page.dart';

class SecondToDoList extends StatefulWidget {
  const SecondToDoList({Key? key}) : super(key: key);

  @override
  State<SecondToDoList> createState() => _SecondToDoListState();
}

class _SecondToDoListState extends State<SecondToDoList> {
  String name1 = "";
  String address1 = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],

                    border: Border(),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    onChanged: (e){
                      setState(() {
                        name1 = e;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                          border: InputBorder.none
                    ),
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.only(top:8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],

                      border: Border(),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:TextField(
                      onChanged:(e){
                        setState(() {
                          address1 = e;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Address",
                            border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                     ),
                       child: TextButton(onPressed: (){
                         Navigator.of(context).pop({"name":name1,"address":address1});
                         setState(() {
                          name1 = "";
                          address1 = "";
                         });
                       }, child: const Text("Submit",style: TextStyle(color: Colors.black),))),
                 )
            ],
          ),
        ),
      ),
    );
  }
}
