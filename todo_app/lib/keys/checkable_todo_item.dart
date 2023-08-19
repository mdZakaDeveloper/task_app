import 'package:flutter/material.dart';

class CheckableTodoItem extends StatefulWidget{

  const CheckableTodoItem({super.key, required this.text, required this.priority});

  final String text;
  final Priority priority; 

  @override
  State<StatefulWidget> createState() {
    return _CheckableTodoItemState();
  }
}

enum Priority{
  urgent,
  managable, 
  low
}

class _CheckableTodoItemState extends State<CheckableTodoItem>{
  
  var _done = false;

  void _setDone(bool? isChecked){
    setState(() {
      _done = isChecked ?? false;
    });

  }
  
  @override
  Widget build(BuildContext context) {

    var icon = Icons.low_priority;

    if(widget.priority == Priority.urgent){
      icon = Icons.notifications_active;
    }

    if(widget.priority == Priority.managable){
      icon = Icons.list;
    }

    return 
    
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(value: _done, onChanged: _setDone),
          const SizedBox(width: 10,),
          Icon(icon),
          const SizedBox(width: 20,),
          Text(widget.text),
        ],
      );
  }
}