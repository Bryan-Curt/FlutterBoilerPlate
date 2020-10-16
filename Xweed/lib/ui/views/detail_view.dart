import 'package:Xweed/core/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailView extends StatelessWidget {
  final Product product;

  DetailView({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
            icon:
                SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
            onPressed: () => {Navigator.pop(context)}),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg",
                  color: Colors.white),
              onPressed: () => {}),
          IconButton(
              icon: SvgPicture.asset("assets/icons/cart.svg",
                  color: Colors.white),
              onPressed: () => {})
        ],
      ),
      backgroundColor: product.color,
      body: Body(product: product),
    );
  }
}

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  // height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("color"),
                              Container(
                                padding: EdgeInsets.all(12),
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Color(0xFF356C95))),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF356C95),
                                      shape: BoxShape.circle),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Aristocratic Hand Bag",
                          style: TextStyle(color: Colors.white)),
                      Text(product.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "\$${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                          ])),
                          Expanded(
                              child:
                                  Image.asset(product.image, fit: BoxFit.fill))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
