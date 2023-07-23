import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracked/model/user_model.dart';

class FirestoreService{
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel? user) async {
    try {
      await _usersCollectionReference.doc(user!.id).set(user.toJson());
    } on FirebaseAuthException catch (e){
      SnackBar(content: Text(e.message.toString()));
    }
  }
}