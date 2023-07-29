import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
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
                          Val.ValidationTitle(val);

                          // if (val!.length < 4 || val.length > 49) {
                          //   return "please enter a valid response";
                          // }
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
                        title: const Text('a. Alert @ 1 day to deadline'),
                        trailing: Switch(
                            value: model.switchState['switchOne']!,
                            onChanged: (value) {
                              model.switched(value);
                            }),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ListTile(
                        title: const Text('a. Alert @ 2 days to deadline'),
                        trailing: Switch(
                            value: model.switchState['switchTwo']!,
                            onChanged: (value) {
                              model.switched(value);
                            }),
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
