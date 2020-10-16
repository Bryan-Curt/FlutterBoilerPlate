import 'dart:async';

import 'package:Xweed/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> signIn(String email, String password) async {
    try {
      final FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        print(user);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    var userId = int.tryParse(email);
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
