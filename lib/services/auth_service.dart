import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracked/model/user_model.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/utils/constants.dart';
import 'package:tracked/utils/locator_setup.dart';
import 'package:tracked/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  /// this function logs user into firebase
  void loginWithEmail(
      {required String email, required String password}) async {
    try {
       await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password).then((value) => _navigationService.navigateTo(doclistRoute));
    } on FirebaseAuthException catch (e) {
     SnackBar(content: Text(e.message.toString(), style: TextStyle(color: Colors.white),), backgroundColor: Colors.black,);
    }
  }


  Future signUpWithEmail(
      {required String email, required String password, required String fullName}) async {
    try {
     UserCredential authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

     UserModel user = UserModel(
       id: authResult.user!.uid.toString(),
       email: authResult.user!.email.toString(),
       fullName: fullName
     );
     await _firestoreService.createUser(user);
     return authResult.user != null;
    }  on FirebaseAuthException catch (e) {
      SnackBar(content:Text(e.message.toString(),),);
      _navigationService.navigateTo(signupRoute);
    }
  }

  Future<bool> isUserLoggedIn() async{
    User? user = await _firebaseAuth.currentUser;
    return user != null;
  }
}