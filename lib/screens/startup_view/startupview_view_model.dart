import 'package:stacked/stacked.dart';
import 'package:tracked/services/auth_service.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/constants/route_names_asigning.dart';
import 'package:tracked/utils/navigator.dart';
import 'package:tracked/utils/locator_setup.dart';

class StartUpViewModel extends BaseViewModel{
  final  AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(addtaskRoute);
    }else {
      _navigationService.navigateTo(loginRoute);
    }
  }
}