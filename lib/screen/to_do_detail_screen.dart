import 'package:flutter/material.dart';

class ToDoDetailScreen extends StatefulWidget {
  const ToDoDetailScreen({ Key? key }) : super(key: key);

  @override
  _ToDoDetailScreenState createState() => _ToDoDetailScreenState();
}

class _ToDoDetailScreenState extends State<ToDoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: new Text('To Do Detail'),),));
  }
}