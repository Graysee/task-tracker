import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracked/model/user_model.dart';

class FirestoreService{
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel? user) async {
    try {
      await _usersCollectionReference.doc(user!.id).set(user.toJson());
    } on FirebaseAuthException catch (e){
      return e.message.toString();
    }
  }

  Future getUser(String? uid) async {
    try {
    var  userData = await _usersCollectionReference.doc(uid).get();
    return UserModel.fromJson(userData.data() as Map<String, dynamic>);
    } on FirebaseException catch (e){
      e.message.toString();
    }
  }
}