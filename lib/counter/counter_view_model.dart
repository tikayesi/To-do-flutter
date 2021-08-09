import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier{
    int _val = 0;
    int get val => _val;

  increment(){
      _val++;
      notifyListeners();
  }

  decrement(){
      _val--;
      notifyListeners();
  }
}