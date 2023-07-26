import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:tracked/model/task_model.dart';
import 'package:tracked/model/user_model.dart';

class FirestoreService{
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
  final CollectionReference _postCollectionReference = FirebaseFirestore.instance.collection('posts');

  Future createUser(UserModel? user) async {
    try {
      await _usersCollectionReference.doc(user!.id).set(user.toJson());
    } on FirebaseAuthException catch (e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

  Future getUser(String? uid) async {
    try {
    var  userData = await _usersCollectionReference.doc(uid).get();
    return UserModel.fromJson(userData.data() as Map<String, dynamic>);
    } on FirebaseException catch (e){
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addPost(Tasks? tasks) async{
    try{
      await _postCollectionReference.add(tasks!.toJson());
      return true; /// the action completed successfully
    } on FirebaseException catch(e){
      if (e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }
}