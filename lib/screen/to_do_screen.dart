import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<String> todos = [];
  TextEditingController todoName = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget listToDo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: todos.map((e) => new Text(e)).toList(),
      ),
    );
  }

  addTodo() {
    setState(() {
      todos.add(todoName.text);
    });
  }

  deleteToDo(String name) {
    setState(() {
      todos.removeWhere((element) => 
      element == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: new AppBar(
        title: new Text('TO DO LIST'),
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Your ToDo'),
                      controller: todoName,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your ToDo';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addTodo();
                            }
                          },
                          child: const Text('Submit')),
                    )
                  ],
                )),
          ),
          Expanded(
              child: Card(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Scrollbar(
              child: ListView.builder(
                  itemCount: todos.length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: ListTile(
                              leading: Icon(
                                Icons.access_alarms,
                                size: 40.0,
                              ),
                              title: Text(todos[index]),
                            ))
                            ,
                            Expanded(child: TextButton(onPressed:
                             () => deleteToDo(todos[index]),
                            child: Icon(Icons.delete),))
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ))
        ],
      )),
    ));
  }
}
