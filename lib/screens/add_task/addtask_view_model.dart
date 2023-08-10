
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/constants/route_names_asigning.dart';
import 'package:tracked/model/task_model.dart';
import 'package:tracked/model/user_model.dart';
import 'package:tracked/services/auth_service.dart';
import 'package:tracked/services/firestore_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/utils/locator_setup.dart';
import 'package:tracked/utils/validation.dart';
import 'package:tracked/services/dialog_service.dart';

class AddTaskViewModel extends BaseViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  UserModel? get currentUser => _authenticationService.currentUser;

  Tasks? tasks;
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  String? selectedDate;

  int _daysAhead = 365;
  int get daysAhead => _daysAhead;

  Map<String, bool> _options = {'switchOne': true, 'switchTwo':false};
  Map<String, bool> get options => _options;

  bool? singValue;

  void isChecked(bool newValue){
    for(bool value in _options.values){
      singValue = value;
    }
    singValue = newValue;
    notifyListeners();
  }


  ///TODO add the CRUD dart file here
  Future<String>? selectDate(BuildContext context) async {
   final DateTime? pickedDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2026));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      selectedDate = formattedDate;
    }
    return selectedDate!;
  }



  Future addTask({required String title, required String deadline }) async{
    setBusy(true);
    var result = await _firestoreService.addTask(Tasks(title: title, deadline: deadline, id:currentUser?.id));
    setBusy(false);
    validateResult(result);
    _navigationService.navigateTo(tasklistRoute);
  }


  void validateResult(var result)async{
    if (result is String){
      await _dialogService.showDialog(
          title: 'Could not add Post',
          description: result
      );
    }else{
      await _dialogService.showDialog(
          title: 'Post successfully Added',
          description: 'Your post has been created'
      );
    }
  }

}
