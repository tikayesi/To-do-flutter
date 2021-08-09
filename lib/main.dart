import 'package:flutter/material.dart';
import 'package:to_do_flutter/counter/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => CounterScreen(),
        // '/detail': (context) => ToDoDetailScreen()
      },
    );
  }
}

