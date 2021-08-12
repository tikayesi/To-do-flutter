import 'package:flutter/material.dart';
import 'package:to_do_flutter/model/book.dart';
import 'package:to_do_flutter/repository/book_repository.dart';

class ViewModel with ChangeNotifier{
  Book? _book;

  Book? get book{
    return _book;
  }

  BookRepository _bookRepository = BookRepository();

  getBookById()async{
    final newBook = await _bookRepository.getBookById('2');
    _book = newBook;
    notifyListeners();
  }

  addBook(Book newBook)async{
      final newBookRegistered = await _bookRepository.addBook(newBook);
      print(newBookRegistered);
      notifyListeners();
  }

}