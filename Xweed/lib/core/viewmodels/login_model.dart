import 'package:Xweed/core/enums/viewstate.dart';
import 'package:Xweed/core/services/authentication_service.dart';
import 'package:Xweed/core/viewmodels/base_model.dart';

import '../../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);
    // email or password empty
    if (email.isEmpty || password.isEmpty) {
      errorMessage = ' Email or password is empty';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.signIn(email, password);

    setState(ViewState.Idle);
    return success;
  }
}
