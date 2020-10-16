import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () => {}),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",
                color: Colors.black),
            onPressed: () => {}),
        IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",
                color: Colors.black),
            onPressed: () => {})
      ],
    );
  }
}
