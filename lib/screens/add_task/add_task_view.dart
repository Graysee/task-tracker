import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/components/rounded_button.dart';
import 'package:tracked/screens/add_task/addtask_view_model.dart';
import 'package:tracked/utils/validation.dart';

class AddTasks extends StatelessWidget {
  AddTasks({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final int daysAhead = 365;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController deadlineController =TextEditingController();


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
          //   appBar:
          // );
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  title: Text(titleController.text != ""
                      ? titleController.text
                      : "New Document"),
                  actions: <Widget>[
                          PopupMenuButton(
                              itemBuilder: (context) {
                            return model.menuOptions.map((String? choice) {
                              return PopupMenuItem<String>(
                                  value: choice, child: Text(choice!));
                            }).toList();
                          })
                        ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        controller: titleController,
                        inputFormatters: [LengthLimitingTextInputFormatter(50)],
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          icon: Icon(Icons.title, size: 30.0,),
                          hintText: "Enter the task name",
                          labelText: "Task name",
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        // onChanged: (text){},
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        enabled: true,
                        validator: (val) {
                          Val.ValidationTitle(val);

                          // if (val!.length < 4 || val.length > 49) {
                          //   return "please enter a valid response";
                          // }
                        },),
                      SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                model.selectDate(context, deadlineController.text);
                              },
                              child: TextFormField(
                                controller: deadlineController,
                                maxLength: 10,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_month, size: 30.0,),
                                  labelText:'Deadline (i.e. ${DateUtility.daysAheadAsString(daysAhead)})',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                // onChanged: (text){},
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                enabled: false,
                                validator: (val) =>
                                  DateUtility.isValidDate(val!) ? null : "Not a valid future date",
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text('a. Alert @ 2 days to deadline'),
                        trailing: Switch(value: model.isSwitched, onChanged: (value){
                          model.switched(value);
                        }),
                      ),
                      SizedBox(height: 10.0,),
                      ListTile(
                        title: Text('a. Alert @ 2 days to deadline'),
                        trailing: Switch(value: model.isSwitched, onChanged: (value){
                          model.switched(value);
                        }),
                      ),

                      RoundedButton(
                        onPress: ()
                        {
                          if (
                          titleController.text.isNotEmpty && deadlineController.text.isNotEmpty
                          ){
                          model.addTask(title: titleController.text, deadline: deadlineController.text);}},
                        buttonchild: Text('Save', style: TextStyle(fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18.0),),
                        buttoncolor: Colors.indigo,
              
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
