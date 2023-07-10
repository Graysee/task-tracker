import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tracked/services/anouser_service.dart';
import 'package:tracked/services/firebaseauthservice.dart';
import 'package:tracked/services/login_service.dart';
import 'package:tracked/services/task_services.dart';
import 'package:tracked/services/user_service.dart';

final GetIt serviceLocator = GetIt.I; ///short form to access the instance of getit

Future locatorSetup()  async{

  WidgetsFlutterBinding.ensureInitialized(); ///this initializes flutter widget binding
  // serviceLocator.registerLazySingleton(() => UserService());
  // serviceLocator.registerLazySingleton(() => TaskService());
  serviceLocator.registerLazySingleton(() => AnoUserService());
  serviceLocator.registerLazySingleton(() => LoginService());
  serviceLocator.registerLazySingleton(() => FirebaseAuthService());
}
