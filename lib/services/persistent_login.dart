import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PersistLoginAuthService {
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<bool> isUserLoggedIn() async{
  var user = _firebaseAuth.currentUser;
  return user != null;
}
}