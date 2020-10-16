import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  Function onTap;
  String logo;
  SocialBtn(@required this.onTap, @required this.logo);
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: 120,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.black12),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 20.0,
              width: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(this.logo)
                )
              ),
            ),
            Text("Sign in"),
          ],
        ),
      ),
    );
  }
}
