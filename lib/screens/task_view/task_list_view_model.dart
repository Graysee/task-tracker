import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/constants/route_names_asigning.dart';
import 'package:tracked/services/dialog_service.dart';
import 'package:tracked/services/firestore_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/utils/locator_setup.dart';
import 'package:tracked/utils/validation.dart';
import '../../model/task_model.dart';

class TaskViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Tasks>? _task;
  List<Tasks>? get tasks => _task;

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  Future fetchTasks() async {
    setBusy(true);

    var taskResults = await _firestoreService.getPostOnceOff();
    setBusy(false);

    if (taskResults is List<Tasks>) {
      _task = taskResults;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: 'task Update Failed',
        description: taskResults,
      );
    }
  }


  void navigateToAddTask() {
    _navigationService.navigateTo(addtaskRoute);
  }

  void toggleDoneness(bool value) {
    _isChecked = value;
    notifyListeners();
  }

}
