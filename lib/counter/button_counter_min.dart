import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/counter/counter_view_model.dart';

class ButtonCounterMin extends StatelessWidget {

  // final Function decrement;
  const ButtonCounterMin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: () {
        // Provider.of<CounterViewModel>
        // (context, listen: false).decrement();
        context.read<CounterViewModel>
        ().decrement();
      }
              , child: Text('-', style: TextStyle(fontSize: 
              30.0),)),
    );
  }
}