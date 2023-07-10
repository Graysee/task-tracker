import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future loginWithEmail ({@required String? email, String? password}) async {
    try
  {
    var user = await _firebaseAuth.signInWithEmailAndPassword(email: email!, password: password!);
    return user;
  }on FirebaseAuthException catch(e){
      return e.message;
    }
}

  Future signUpWithEmail({@required String? email, @required String? password, @required String? fullname}) async{
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);
      return authResult.user;
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }

}