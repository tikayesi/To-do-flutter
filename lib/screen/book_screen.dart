import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/model/book.dart';
import 'package:to_do_flutter/repository/book_repository.dart';
import 'package:to_do_flutter/view_model/view_model.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    //_bookRepository.addBook(Book(title: 'Rembulan Tenggelam', publisher: 'Gramedia'));
    return Scaffold(
      appBar: AppBar(title: Text('Get Book by id'),),
      body: ChangeNotifierProvider(
        create: (context) => ViewModel(),
        builder: (context, child) {
          return Column(
            children: [
              Text(context.watch<ViewModel>().book?.title ?? ''),
              Text(context.watch<ViewModel>().book?.publisher ?? ''),
              TextButton(
                onPressed: () {
                  context.read<ViewModel>().getBookById();
                },
                child: Text('Cari Judul Buku'),
              ),
              TextButton(
                  onPressed: () {
                        Navigator.popAndPushNamed(context, '/');
                  },
                  child: Text('Back'))
            ],
          );
        },
      ),
    );
  }
}
