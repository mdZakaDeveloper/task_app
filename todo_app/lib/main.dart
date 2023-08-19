import 'package:flutter/material.dart';
import 'package:todo_app/keys/keys.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Internals')),
        body: const Keys()
        ),
        
        ),
    

  );
}