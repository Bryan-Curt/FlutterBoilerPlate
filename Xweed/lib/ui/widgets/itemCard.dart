import 'package:Xweed/core/models/product.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;

  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
                color: product.color, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(product.image),
          ),
          SizedBox(height: 5),
          Text(product.title, style: TextStyle(color: Colors.black54)),
          Text("\$${product.price}",
              style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
