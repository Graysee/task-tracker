import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/services/firebaseauthservice.dart';
import 'package:tracked/utils/locator_setup.dart';
import 'package:tracked/utils/navigator.dart';

class SignupViewModel extends BaseViewModel {
  final FirebaseAuthService _firebaseAuthService =
      serviceLocator<FirebaseAuthService>();

  Future signUp(
      {@required String? email,
      @required String? password,
      @required String? fullname}) async {
    setBusy(true);

    var result = await _firebaseAuthService.signUpWithEmail(
        email: email!, password: password!, fullname: fullname!);

    setBusy(false);
    if (result is bool) {
      if (result) {
        return 'Successful';
      } else {
        await 'this attempt was unsuccessful';
      }
    } else {
      await 'Signup failed';
    }
  }
}
