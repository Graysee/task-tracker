import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tracked/services/task_services.dart';
import 'package:tracked/services/user_service.dart';

final GetIt serviceLocator = GetIt.I; ///short form to access the instance of getit

Future locatorSetup()  async{

  WidgetsFlutterBinding.ensureInitialized(); ///this initializes flutter widget binding
  serviceLocator.registerLazySingleton(() => UserService());
  serviceLocator.registerLazySingleton(() => TaskService());
}
