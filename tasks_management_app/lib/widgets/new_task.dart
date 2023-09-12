import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/models/task.dart';

class NewTask extends StatefulWidget {

  
  NewTask({super.key,});


  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {


  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid Input'),
                content: Text(
                    'Please check whether all the details are Entered correctly!',
                    style: GoogleFonts.inter()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        'Try Again',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ))
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: Text(
                    'Please check whether all the details are Entered correctly!',
                    style: GoogleFonts.inter()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        'Try Again',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ))
                ],
              ));
    }
  }

  void submitTask() {

    final enteredTitle = titleController.text;
    final enteredDescription = descriptionController.text;
    bool isChecked = false;

    if (enteredTitle.trim().isEmpty ||
        enteredTitle.isEmpty ||
        descriptionController == null ||
        enteredDescription.trim().isEmpty) {
      _showDialog();

      return;
    }

    Navigator.of(context).pop(Task(title: enteredTitle, description: enteredDescription, isChecked: isChecked));
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLength: 25,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary)),
                  label: Text(
                    'Title',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 15,
                        ),
                  ),
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                maxLength: 100,
                controller: descriptionController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                    label: Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 15,
                          ),
                    ),
                    hintStyle: Theme.of(context).textTheme.titleMedium),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: submitTask,
                      child: Text('Add Task',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.primary)))
                ],
              )
            ],
          ),
        ));
  }
}
