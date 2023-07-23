import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/services/auth_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/constants/route_names_asigning.dart';
import 'package:tracked/utils/locator_setup.dart';

class AuthViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void signUp({
    String? email,
    String? password,
    String? fullName,
  }) {
    _authenticationService.signUpWithEmail(email: email!, password: password!, fullName: fullName!).then((value) =>
        _navigationService.navigateTo(doclistRoute)
    );
  }

  void login({String? email, String? password}) {

    setBusy(true);
    _authenticationService.loginWithEmail(email: email!, password: password!).then((value) {
      setBusy(false);
      _navigationService.navigateTo(doclistRoute);
    }).onError((error, stackTrace) {
    });
  }

  void navigateToSignup(){
    _navigationService.navigateTo(signupRoute);
  }
}
