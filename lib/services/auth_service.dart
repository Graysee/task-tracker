import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracked/model/user_model.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/utils/locator_setup.dart';
import 'package:tracked/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;


  Future _populateCurrentUser(User? user) async{
    if (user != null){
       _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  /// this function logs user into firebase
  Future loginWithEmail(
      {required String email, required String password}) async {
    try {
     UserCredential authResult =  await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
     await _populateCurrentUser(authResult.user);
     return authResult.user!=null;
    } on FirebaseAuthException catch (e) {
    return e.message.toString();
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
      return e.message.toString();
    }
  }

  Future<bool> isUserLoggedIn() async{
    User? user = await _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }
}