import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/screens/task_view/task_list_view_model.dart';
import 'package:tracked/screens/task_view/task_items.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
        viewModelBuilder: () => TaskViewModel(),
        onViewModelReady: (model) => model.listenForTasks(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Tasks'),
              backgroundColor: Colors.indigo,
            ),
            body: model.tasks != null ? ListView.builder(
              itemCount: model.tasks!.length,
              itemBuilder: (context, index)=>TaskItem(task: model.tasks![index],)
              ):
                  Center(
                    child: Text("No task added yet")
              ),
            floatingActionButton: FloatingActionButton(onPressed: (){
              model.navigateToAddTask();
            },
            child: const Icon(Icons.add, size: 40.0, ),
            ),
          );
        });
        }
  }