import 'package:mobx/mobx.dart';

import '../../../../shared/helpers/app_routes_helper.dart';
import '../../../../shared/helpers/navigation_helper.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  void navigateToSignup() {NavigationHelper.navigateTo(AppRoutesHelper.authSignup);
  }

  void navigateToLoginByEmail() { NavigationHelper.navigateTo(AppRoutesHelper.authLogin);
  }
}
