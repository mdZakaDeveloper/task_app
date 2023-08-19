import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left : 20.0),
          child: InkResponse(
            onTap :() => print('Menu'),
            child : const Icon(Icons.menu_rounded,
            size: 30.0),
          ),
          
        ),
      ),
    );
  }
}