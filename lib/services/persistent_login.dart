import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PersistLoginAuthService {
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<bool> isUserLoggedIn() async{
  var user = _firebaseAuth.currentUser;
  return user != null;
}

Future signUpWithEmail({
  required String? email,
  required String? fullName,
  required String? password,
}) async {
  try {
    var authResult = await
        _firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);

  } on FirebaseAuthException catch (e) {
    return e.message.toString();
  }
}
}