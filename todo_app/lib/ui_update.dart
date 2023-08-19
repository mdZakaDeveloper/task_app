import 'package:flutter/material.dart';
import 'package:todo_app/demo_buttons.dart';




class UiUpdate extends StatelessWidget{

  

  

   @override
  Widget build(BuildContext context) {

    print('UiUpdate class is built');
    return const Padding(
      
      padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: DemoButtons()
      ),
    );
  }
}




 