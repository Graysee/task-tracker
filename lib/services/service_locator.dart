import 'package:get_it/get_it.dart';
import 'package:tracked/services/login_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/services/persistent_login.dart';
import 'package:tracked/services/user_service.dart';


GetIt locator = GetIt.I;

void setupLocator(){

  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => PersistLoginAuthService());
  locator.registerLazySingleton(() => NavigationService());
}