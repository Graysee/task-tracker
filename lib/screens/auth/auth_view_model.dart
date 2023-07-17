
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/services/persistent_login.dart';
import 'package:tracked/services/service_locator.dart';

class AuthViewodel extends BaseViewModel {

  final PersistLoginAuthService _persistLoginAuthService = locator<
      PersistLoginAuthService>();

  Future signUp({
    @required String? fullName,
    @required String? email,
    @required String? password,
  }) async {
    var result = await _persistLoginAuthService.signUpWithEmail(
        fullName: fullName, email: email, password: password);
  }
}
