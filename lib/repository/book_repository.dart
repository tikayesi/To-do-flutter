import 'package:sqflite/sqlite_api.dart';
import 'package:to_do_flutter/dao/book_dao.dart';
import 'package:to_do_flutter/db/DB_helper.dart';
import 'package:to_do_flutter/model/book.dart';

class BookRepository{
  final DBHelper _dbHelper = DBHelper.INSTANCE;

  addBook(Book book) async{
    _dbHelper.insert(BookDAO.TABLE_NAME, {
      'title' : book.title,
      'publisher' : book.publisher
    });
  }

  Future<Book?> getBookById(String id)async{
    final List<dynamic> result = await _dbHelper
    .query(BookDAO.TABLE_NAME, 'id = ?', [id]);
    if(result != null){
    return Book.fromMap(result.first);
    }else{
      return null;
    }
  }
}