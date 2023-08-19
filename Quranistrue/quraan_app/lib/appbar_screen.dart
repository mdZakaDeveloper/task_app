import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget{
  @override
  State<AppBarScreen> createState() {
    return _AppBarScreenState();
  }
}

class _AppBarScreenState extends State<AppBarScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
          title: const Text('Expense Tracker'),
          actions: [
             Row(children: [
                 const Text('Qibla' ,
                ),
            IconButton(
                onPressed: (){}, icon: const Icon(Icons.navigation))
            ],)
             
          ]),);
  }
}