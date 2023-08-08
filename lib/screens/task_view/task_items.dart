import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/model/task_model.dart';
import 'package:tracked/screens/task_view/task_list_view_model.dart';

class TaskItem extends StatelessWidget {
 final Tasks? task;
 final void Function()? onDeleteTask;

 const TaskItem({Key? key, required this.task, this.onDeleteTask}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
      viewModelBuilder: ()=>TaskViewModel(),
      builder: (context, model, child){
      return ListTile(
      leading: Checkbox(
          value: model.isChecked,
          onChanged: (value){
            model.toggleCheckboxState(value!);
            if (onDeleteTask != null){
              onDeleteTask!();
            }
            
          }
      ),
          title: Text(task!.title!, style: TextStyle(decoration:model.isChecked ? TextDecoration.lineThrough : null),),
        subtitle: Text(task!.deadline!),
      );}
    );
  }
}
