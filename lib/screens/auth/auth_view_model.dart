import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/services/auth_service.dart';
import 'package:tracked/services/dialog_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/constants/route_names_asigning.dart';
import 'package:tracked/utils/locator_setup.dart';

class AuthViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future signUp({
    String? email,
    String? password,
    String? fullName,
  })  async {

    setBusy(true);
     var result = await _authenticationService.signUpWithEmail(email: email!, password: password!, fullName: fullName!);

     setBusy(false);
     if (result is bool) {
       if (result){
         _navigationService.navigateTo(tasklistRoute);
       }else{
         await _dialogService.showDialog(
           title: 'Sign up Failure',
           description: 'General Signup Failure, please try again later'
         );}
     }else {
       await _dialogService.showDialog(
         title: 'SignUp Failure',
         description: result,
       );
     }
     }

  Future login({String? email, String? password}) async{

    setBusy(true);
   var result = await _authenticationService.loginWithEmail(email: email!, password: password!);
    setBusy(false);
    if (result is bool){
      if (result){
        _navigationService.navigateTo(tasklistRoute);
      }else{
        await _dialogService.showDialog(
          title: "Login Failed",
          description: "Couldn\'t login at this moment. please try again later"
        );
      }
    }else{
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignup(){
    _navigationService.navigateTo(signupRoute);
  }
}
