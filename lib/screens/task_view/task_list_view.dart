import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/model/task_model.dart';
import 'package:tracked/screens/task_view/tasklist_view_model.dart';
import 'package:tracked/screens/task_view/TaskItems.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
        viewModelBuilder: () => TaskViewModel(),
        onViewModelReady: (model) => model.fetchTasks(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Tasks'),
              backgroundColor: Colors.indigo,
            ),
            body: model.tasks != null ? ListView.builder(
              itemCount: model.tasks!.length,
              itemBuilder: (context, index)=>TaskItem(task: model.tasks![index],)
              ):
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Theme.of(context).primaryColor
                      ),
                    ),
              ),
            floatingActionButton: FloatingActionButton(onPressed: (){
              model.navigateToAddTask();
            },
            child: Icon(Icons.add, size: 40.0, ),
            ),
          );
        });
        }
  }


// class TaskItem extends StatelessWidget {
//   const TaskItem({Key? key, this.task, this.onDelete}) : super(key: key);
//
//   final Tasks? task;
//   final Function? onDelete;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       margin: const EdgeInsets.only(top: 20),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(5),
//           boxShadow: [
//             BoxShadow(blurRadius: 8, color: Colors.grey[200]!, spreadRadius: 3)
//           ]),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: Text(task!.title!),
//               )),
//           IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () {
//               // if (onDeleteItem != null) {
//               //   onDeleteItem();
//               // }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
