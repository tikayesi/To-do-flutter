import 'package:flutter/material.dart';
import 'package:to_do_flutter/screen/book_form_screen.dart';
import 'package:to_do_flutter/screen/book_screen.dart';

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
        '/': (context) => BookFormScreen(),
        '/book-screen': (context) => BookScreen()
        // '/detail': (context) => ToDoDetailScreen()
      },
    );
  }
}

