import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/constants/route_names_asigning.dart';
import 'package:tracked/services/auth_service.dart';
import 'package:tracked/services/dialog_service.dart';
import 'package:tracked/services/firestore_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/utils/locator_setup.dart';
import 'package:tracked/utils/validation.dart';
import '../../model/task_model.dart';
import '../../model/user_model.dart';

class TaskViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  List<Tasks>? _task;
  List<Tasks>? get tasks => _task;

  void Function()? onDeleteItem;

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void listenForTasks(){
    setBusy(true);
    _firestoreService.listenToTaskRealTime().listen((tasksDate) {
      List<Tasks> updatedTasks = tasksDate;
      if (updatedTasks != null && updatedTasks.isNotEmpty){
        _task = updatedTasks;
        notifyListeners();
      }
      setBusy(false);
    });
  }

  Future deleteTask(int index) async{
   setBusy(true);
   await _firestoreService.deleteTask(_task![index].documentId);
   setBusy(false);
  }

  
  void toggleCheckboxState(bool value) {
    _isChecked = value;
    notifyListeners();
  }
  
  void navigateToAddTask() {
    _navigationService.navigateTo(addtaskRoute);
  }

}
