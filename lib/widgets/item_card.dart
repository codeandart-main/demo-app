import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Cart.dart';
import '../models/Product.dart';
import '../pages/item_page.dart';

class ItemCard extends StatelessWidget {

  //final product;

  const ItemCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //final product = context.read<Product>();

    print('build ItemCard');

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          GestureDetector(
            onTap: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) =>
                  ItemPage(productId: product.id)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(product.imgUrl),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                    child: Text(
                  '${product.title}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
              ],
            ),  
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${product.price}'),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Colors.black12), 
                  onPressed: () {
                    Provider.of<CartDataProvider>(context, listen: false)
                    .addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title,
                      imgUrl: product.imgUrl,
                    );
                  })
              ],
            ),
          ),

        ],
      ),
    );
  }
}
