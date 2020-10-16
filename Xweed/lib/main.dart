import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Xweed/core/services/authentication_service.dart';
import 'package:Xweed/locator.dart';
import 'package:Xweed/ui/router.dart';

import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'X-weed',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
