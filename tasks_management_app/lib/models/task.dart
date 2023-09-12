
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task{

  Task({required this.title, required this.description, required this.isChecked}) : id = uuid.v4();

  final String id;
  final String title;
  final String description;
   bool isChecked;


  

}

