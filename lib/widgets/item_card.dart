import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/color.dart';
import '../models/item.dart';

class ItemCard extends StatelessWidget {

  final Item item;
  final Function press;

  const ItemCard({
    Key key,
    this.item,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){press(item);},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${item.id}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(item.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(item.id.toString(),
                    style: TextStyle(
                        color: AppColor.lightblue,
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  ),
                ),
                Text(
                  item.name,
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
                SizedBox(height: 8),
                Text(
                  "${item.price.toString()} руб.",
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
