import 'package:stacked/stacked.dart';
import 'package:tracked/services/navigation_service.dart';
import 'package:tracked/services/persistent_login.dart';
import 'package:tracked/services/service_locator.dart';
import 'package:tracked/utils/constants.dart';
import 'package:tracked/utils/navigator.dart';
import '';

class StartUpViewModel extends BaseViewModel{
  final PersistLoginAuthService _persistLoginAuthService = locator<PersistLoginAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _persistLoginAuthService.isUserLoggedIn();
    
    if (hasLoggedInUser) {
      _navigationService.navigateTo(doclistRoute);
    }else {
      _navigationService.navigateTo(loginRoute);
    }
  }
}