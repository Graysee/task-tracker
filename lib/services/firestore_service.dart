import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:tracked/model/task_model.dart';
import 'package:tracked/model/user_model.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _tasksCollectionReference =
      FirebaseFirestore.instance.collection('posts');
  final StreamController<List<Tasks>> _taskController =
      StreamController<List<Tasks>>.broadcast();

  List<Tasks>? _task;
  List<Tasks> get task => _task!;

  Future createUser(UserModel? user) async {
    try {
      await _usersCollectionReference.doc(user!.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getUser(String? uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return UserModel.fromJson(userData.data() as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addTask(Tasks task) async {
    try {
      await _tasksCollectionReference.add(task.toJson());
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Stream<List<Tasks>> listenToTaskRealTime() {
    _tasksCollectionReference.snapshots().listen((tasksSnapshot) {
      if (tasksSnapshot.docs.isNotEmpty) {
        var tasks = tasksSnapshot.docs
            .map((snapshot) => Tasks.fromJson(
                snapshot.data() as Map<String, dynamic>, snapshot.id))
            .where((mappedItem) =>
                mappedItem.title != null && mappedItem.deadline != null)
            .toList();
        _taskController.add(tasks);
      }
    });
    return _taskController.stream;
  }

  Future updateTask(Tasks task)async{
    try {
      await _tasksCollectionReference.doc(task.documentId).update(task.toJson());
      return true;
    } catch (e){
      if (e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }


  Future deleteTask(String? documentId) async {
    await _tasksCollectionReference.doc(documentId).delete();
  }
}
