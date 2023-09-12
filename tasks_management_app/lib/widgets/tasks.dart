import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/widgets/new_task.dart';
import 'package:task_app/widgets/task_analysis.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Task> taskList = [];
  List<Task> completedTasks = [];

  void addTask() async {
    final taskData = await Navigator.push<Task>(
        context, MaterialPageRoute(builder: (ctx) => NewTask()));

    setState(() {
      taskList.add(taskData!);
    });
  }

  void removeTask(Task task) {

    final taskIndex = taskList.indexOf(task);


    setState(() {
      taskList.remove(task);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        'Task Deleted',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            taskList.insert(taskIndex, task);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {

    int completedCount = taskList.where((task) => task.isChecked).length;

    Widget content = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TaskAnalysis(
            totalTasks: taskList.length,
            totalCompletedTasks: completedCount,
          ),
          const SizedBox(
            height: 250,
          ),
          IconButton(
              icon: Icon(
                Icons.format_list_bulleted_add,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.push<Task>(
                    context, MaterialPageRoute(builder: (ctx) => NewTask()));
              }),
          const SizedBox(
            height: 20,
          ),
          Text('No Tasks Added',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );

    if (taskList.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TaskAnalysis(
                totalTasks: taskList.length,
                totalCompletedTasks: completedCount),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (ctx, singleTask) => Dismissible(
                      key: ValueKey(taskList[singleTask].id),
                      onDismissed: (direction) {
                        removeTask(taskList[singleTask]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          alignment: Alignment.center,
                          height: 70,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Checkbox(
                                  value: taskList[singleTask].isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      taskList[singleTask].isChecked =
                                          value ?? false;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    taskList[singleTask].title,
                                    style: TextStyle(
                                        decoration: taskList[singleTask].isChecked
                                            ? TextDecoration.lineThrough
                                            : null,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    taskList[singleTask].description,
                                    style: TextStyle(
                                        decoration: taskList[singleTask].isChecked
                                            ? TextDecoration.lineThrough
                                            : null,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  onTap: () {
                                    removeTask(taskList[singleTask]);
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        size: 25,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  

                      )),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TaskApp',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: content,
      floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 20, bottom: 30),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            onPressed: () => addTask(),
            child: Icon(
              Icons.add_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          )),
    );
  }
}
