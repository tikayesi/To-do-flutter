import 'package:dio/dio.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:to_do_flutter/api/api_helper.dart';
import 'package:to_do_flutter/dao/book_dao.dart';
import 'package:to_do_flutter/db/DB_helper.dart';
import 'package:to_do_flutter/model/book.dart';
import 'package:to_do_flutter/model/response.dart';

class BookRepository{
  final DBHelper _dbHelper = DBHelper.INSTANCE;
  final ApiHelper _apiHelper = ApiHelper.INSTANCE;

  addBook(Book book) async{
    final reponse = await _apiHelper.postData('/book', book.toMap());
    return Book.fromMap(reponse);
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

  Future<List<Book>> getProduct()async{
    final response = await _apiHelper.getData('/books');
    print(ResponseAPI.fromJson(response).data);
    return ResponseAPI.fromJson(response).data;
    
  }
}