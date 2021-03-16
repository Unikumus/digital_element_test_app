import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/color.dart';
import '../models/item.dart';

class DitailPage extends StatefulWidget {
  final Item item;
  DitailPage({this.item});

  @override
  _DitailPageState createState() => _DitailPageState();
}

class _DitailPageState extends State<DitailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.black
        ),
      backgroundColor: AppColor.gray,
      centerTitle: true,
      title: Text("О товаре",
        style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Hero(
                  tag: "${widget.item.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(widget.item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    widget.item.name,
                    style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 23),
                  ),
                ),
                Text(
                  "${widget.item.price.toString()} руб.",
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
