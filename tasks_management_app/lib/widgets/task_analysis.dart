import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskAnalysis extends StatelessWidget{

  const TaskAnalysis({super.key, required this.totalTasks, required this.totalCompletedTasks});

  final int totalTasks;
  final int totalCompletedTasks;

  

  @override
  Widget build(BuildContext context) {



    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.50),
      ),
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Total Tasks', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),),
              const SizedBox(height: 3,),
              Text('$totalTasks', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 40, color: Theme.of(context).colorScheme.primary),)
            ],
          ),
        ),
        const SizedBox(width: 10,),
         SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Completed Tasks', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),),
              const SizedBox(height: 3,),
              Text('$totalCompletedTasks', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 40, color: Theme.of(context).colorScheme.primary),)
            ],
          ),
        ),
        
      ],)
    );
  }
}