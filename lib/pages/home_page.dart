import 'package:flutter/material.dart';
import '../ulti/dialog_box.dart';
import '../ulti/todo_tile.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List toDoList = [
    ["This is a task!", false],
  ];

  // checkbox was tapped
  void checkBoxChange(bool? valuew,int index){
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
  }

  // save new task
  void saveNewTask(){
    setState(() {
      toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        
        title: Text("TO DO",),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChange(value, index),
            );
        },
    ),
    );
  }
}