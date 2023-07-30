import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/components/checkbox.dart';
import 'package:tracked/components/rounded_button.dart';
import 'package:tracked/screens/add_task/addtask_view_model.dart';
import 'package:tracked/utils/validation.dart';

class AddTasks extends StatelessWidget {
  AddTasks({Key? key}) : super(key: key);


  final TextEditingController titleController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
        viewModelBuilder: () => AddTaskViewModel(),
        builder: (context, model, child)
        {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("New Document"),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30.0),
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        controller: titleController,
                        inputFormatters: [LengthLimitingTextInputFormatter(50)],
                        textCapitalization: TextCapitalization.words,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.title,
                            size: 30.0,
                          ),
                          hintText: "Enter the task name",
                          labelText: "Task name",
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        enabled: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Text field can\'t be empty";
                          }
                          if (val.length < 4 || val.length > 49) {
                            return "please enter a valid response";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: deadlineController,
                              maxLength: 10,
                              cursorColor: Colors.black,
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.calendar_month,
                                  size: 30.0,
                                ),
                                labelText:
                                    'Deadline (i.e. ${DateUtility.daysAheadAsString(model.daysAhead)})',
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              onTap: ()  async{
                               String? date =  await model.selectDate(context,);
                               deadlineController.text = date!;
                              },
                              validator: (val) => DateUtility.isValidDate(val!)
                                  ? null
                                  : "Not a valid future date",
                            ),
                          ),
                        ],
                      ),
                     ListTile(
                       title: Text('Remind me a day to deadline'),
                       trailing: Checkbox(value: model.options['switchOne'], onChanged: (value){model.isChecked(value!);}),
                     ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ListTile(
                        title: Text('Remind me two days to deadline'),
                        trailing: Checkbox(value: model.options['switchTwo'], onChanged: (value){model.isChecked(value!);}),
                      ),
                      RoundedButton(
                        onPress: () {
                          if (titleController.text.isNotEmpty &&
                              deadlineController.text.isNotEmpty) {
                            model.addTask(
                                title: titleController.text,
                                deadline: deadlineController.text);
                          }
                        },
                        buttonchild: const Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18.0),
                        ),
                        buttoncolor: Colors.indigo,
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
