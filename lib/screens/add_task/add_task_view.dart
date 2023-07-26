import 'package:flutter/material.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/screens/add_task/addtask_view_model.dart';

class AddTasks extends StatelessWidget {
  AddTasks({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final int daysAhead = 5475;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController deadlineController =TextEditingController();

  bool yearController = true;
  bool halfYearController = true;
  bool quarterController = true;
  bool monthController = true;
  // bool fqLessMonthController = true;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
        viewModelBuilder: () => AddTaskViewModel(),
        // onViewModelReady: (model) => model.initControllers(
        //     titleController.text,
        //     deadlineController,
        //     yearController,
        //     halfYearController,
        //     quarterController,
        //     monthController),
        builder: (context, model, child) {
          // return Scaffold(
          //   resizeToAvoidBottomInset: false,
          //   appBar: AppBar(
          //     title: Text(titleController.text != ""
          //         ? titleController.text
          //         : "New Document"),
          //     actions: (titleController.text == "")
          //         ? <Widget>[]
          //         : <Widget>[
          //             PopupMenuButton(
          //
          //                 itemBuilder: (context) {
          //               return model.menuOptions.map((String? choice) {
          //                 return PopupMenuItem<String>(
          //                     value: choice, child: Text(choice!));
          //               }).toList();
          //             })
          //           ],
          //   ),
          // );
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                      model.addTask(title: titleController.text);
                  },
                child: Icon(Icons.add),
                backgroundColor: Colors.grey[600],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height:  10.0,),
                    Text(
                      'Create Post',
                      style: TextStyle(fontSize: 26),
                    ),
                    SizedBox(height:  10.0,),
                    TextFormField(
                      controller: titleController,),
                    SizedBox(height:  10.0,),
                    Text('Post Image'),
                    SizedBox(height:  10.0,),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Text(
                        'Tap to add post image',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
