import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/counter/counter_view_model.dart';

class ButtonCounterPlus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: (){
        Provider.of<CounterViewModel>
        (context, listen: false).increment();
      }
              , child: Text('+', 
              style: TextStyle(fontSize: 
              30.0))),
    );
  }
}