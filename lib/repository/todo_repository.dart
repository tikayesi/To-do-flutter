import 'package:to_do_flutter/model/to_do.dart';

class ToDoRepository{
    List<ToDo> todos = <ToDo>[];

    List<ToDo> getListToDo(){
      return todos;
    }

     addTodo(ToDo toDo) {
      todos.add(toDo);
  }

      deleteToDo(int id) {
      todos.removeWhere((element) => 
      element.id == id);
  }
}