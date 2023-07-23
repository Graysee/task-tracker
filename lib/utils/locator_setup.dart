
import 'package:get_it/get_it.dart';
import 'package:tracked/services/auth_service.dart';
import 'package:tracked/services/firestore_service.dart';
import 'package:tracked/services/login_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/services/user_service.dart';

GetIt locator = GetIt.I; ///initialize get it

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerFactory(() => LoginService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
} ///this function registers all the services we are making use of at one place, its called
///in the main so we can access it from anywhere