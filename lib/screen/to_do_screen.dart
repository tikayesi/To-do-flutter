import 'package:flutter/material.dart';
import 'package:to_do_flutter/model/to_do.dart';
import 'package:to_do_flutter/repository/todo_repository.dart';
import 'package:to_do_flutter/screen/to_do_detail_screen.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  ToDoRepository _toDoRepository = ToDoRepository();
  TextEditingController todoName = new TextEditingController();
  TextEditingController toDoDescription = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
                     TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Your Description'),
                      controller: toDoDescription,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your description';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                 _toDoRepository.addTodo(
                                   new ToDo(_toDoRepository.getListToDo().length+1,
                                    todoName.text, toDoDescription.text));
                              });

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
                  itemCount: _toDoRepository.getListToDo().length,
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
                              title: Text(_toDoRepository.getListToDo()[index].todo),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: 
                                (context) => ToDoDetailScreen()));
                              },
                            ))
                            ,
                            Expanded(child: TextButton(onPressed:
                             (){
                               setState(() {
                                 _toDoRepository.deleteToDo(
                                   _toDoRepository.getListToDo()[index].id);
                               });
                             } ,
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
