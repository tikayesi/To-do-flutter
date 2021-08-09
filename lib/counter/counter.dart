import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/counter/button_counter_min.dart';
import 'package:to_do_flutter/counter/button_counter_plus.dart';
import 'package:to_do_flutter/counter/counter_operator.dart';
import 'package:to_do_flutter/counter/counter_view_model.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({ Key? key }) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Counter'),),
        body: ChangeNotifierProvider(
          create: (context) => CounterViewModel(),
          builder: (context, child){
            return  Column(children: [
              Text('${context.watch<CounterViewModel>().val}'),
              CounterOperator()
            ],);
          },
        //   child:  Column(
        //     children: [
        //       Consumer<CounterViewModel>
        //       (builder: (context, value, child){
        //           return Text('${value.val}',
        //            style: TextStyle(fontSize: 
        //       30.0));
        //       }),
        //   CounterOperator()
        // ],),
        )
        
      
        )
        );
  }
}