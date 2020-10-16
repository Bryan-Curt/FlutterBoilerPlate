import 'package:Xweed/core/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:Xweed/core/enums/viewstate.dart';
import 'package:Xweed/core/models/user.dart';
import 'package:Xweed/core/viewmodels/home_model.dart';
import 'package:Xweed/ui/shared/app_colors.dart';
import 'package:Xweed/ui/shared/text_styles.dart';
import 'package:Xweed/ui/widgets/itemCard.dart';
import 'package:Xweed/ui/widgets/categories.dart';
import 'package:Xweed/ui/views/detail_view.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
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
          ),
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Women',
                        style: headerStyle,
                      ),
                    ),
                    Categories(),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.75),
                          itemBuilder: (context, index) => ItemCard(
                              product: products[index],
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailView(
                                          product: products[index]))))),
                    ))
                  ],
                )),
    );
  }
}
