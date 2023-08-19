import 'package:flutter/material.dart';
import 'package:todo_app/keys/keys.dart';


enum Priority{
  urgent,
  managable,
  low
}

class TodoItem extends StatelessWidget{

  const TodoItem({required this.text, required this.priority, super.key});

  final String text;
  final Priority priority;

  

  @override
  Widget build(BuildContext context) {

    var icon  =  Icons.low_priority;

    if(priority == Priority.urgent){

      icon =  Icons.notifications_active;
    }

    if(priority == Priority.managable){
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20,),
          Text(text),
        ],
      ),
    );
  }
}