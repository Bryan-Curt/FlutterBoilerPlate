import 'package:flutter/material.dart';
import 'package:Xweed/ui/shared/ui_helpers.dart';
import 'package:Xweed/ui/widgets/error_message.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final String validationMessage;

  LoginHeader({@required this.controllerEmail, @required this.controllerPassword, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      UIHelper.verticalSpaceMedium(),
      LoginTextField(controllerEmail, "Email", Icons.email, false),
      LoginTextField(controllerPassword, "Password", Icons.lock, true),
      SizedBox(height: 8),
      this.validationMessage != null
          ? Container( margin: EdgeInsets.symmetric(horizontal: 40),
          child: ErrorMessage(message:this.validationMessage)
      ) : Container()
    ]);
  }
}

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  String type;
  IconData icon;
  bool obscureText;

  LoginTextField(this.controller, this.type, this.icon, this.obscureText);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.5),
      margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 7.0),
      height: 55.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(50.0)),
      child: TextField(
          obscureText: this.widget.obscureText,
          decoration: InputDecoration(hintText: this.widget.type,
            border: InputBorder.none,
            prefixIcon: Icon(
              this.widget.icon,
              color: Colors.blue,
            ),
              suffixIcon:this.widget.type == "Password" ?  IconButton(
                icon : Icon(
                  Icons.remove_red_eye,
                  color: Colors.black
                ),
                onPressed: () {
                  setState(() => this.widget.obscureText = !this.widget.obscureText);
                }
              ): Text("")
          ),
          controller: widget.controller)
    );
  }
}
