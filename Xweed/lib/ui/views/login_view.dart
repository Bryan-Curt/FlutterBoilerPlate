import 'package:flutter/material.dart';
import 'package:Xweed/core/enums/viewstate.dart';
import 'package:Xweed/core/viewmodels/login_model.dart';
import 'package:Xweed/ui/shared/app_colors.dart';
import 'package:Xweed/ui/widgets/login_header.dart';
import 'package:Xweed/ui/widgets/social_btn.dart';

import 'base_view.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image(
                image: AssetImage('assets/images/onboarding0.png'),
                height: 300,
                width: 300,
              ),
            ),
            LoginHeader(
                validationMessage: model.errorMessage,
                controllerEmail: _controllerEmail,
                controllerPassword: _controllerPassword),
            SizedBox(height: 10),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 35.0),
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    height: 98.0,
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () async {
                        var loginSuccess = await model.login(
                            _controllerEmail.text, _controllerPassword.text);
                        print(loginSuccess);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SocialBtn(() => {
                  Navigator.pushNamed(context, 'post');
                  }, "assets/logos/facebook.jpg"),
                  SocialBtn(() async {}, "assets/logos/google.jpg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
