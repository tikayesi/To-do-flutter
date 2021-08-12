import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/model/book.dart';
import 'package:to_do_flutter/view_model/view_model.dart';

class BookFormScreen extends StatefulWidget {
  const BookFormScreen({Key? key}) : super(key: key);

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Book'),),
      body: Container(
          child: ChangeNotifierProvider(
        create: (context) => ViewModel(),
        builder: (context, child) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  context.read<ViewModel>().addBook(Book(
                      title: 'Paw paw',
                      desc: 'desc',
                      year: 0,
                      pages: 0,
                      language: 'language',
                      publisher: 'publisher',
                      price: 0,
                      stock: 0));
                },
                child: Text('Tambah Buku'),
              )
            ],
          );
        },
      )),
    );
  }
}
