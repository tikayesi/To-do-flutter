import 'package:to_do_flutter/model/book.dart';

class ResponseAPI{
  final int code;
  final String description;
  final List<Book> data;

  ResponseAPI({
    required this.code,
    required this.description,
    required this.data
    });

    Map<String, dynamic> toMap() => {
        'code': code,
        'description': description,
        'data': data,
      };


  factory ResponseAPI.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['Data'] as List;
    List<Book> listData = list.map((i) => Book.fromJson(i)).toList();

    return ResponseAPI(
      code : parsedJson['Code'],
      description : parsedJson['Description'],
      data : listData);

  }

}