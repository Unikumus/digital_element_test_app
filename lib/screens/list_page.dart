import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/color.dart';
import '../models/item.dart';
import '../models/products.dart';
import '../providers/api_provider.dart';
import '../widgets/item_card.dart';
import 'ditali_page.dart';

class ListPage extends StatefulWidget {
  ApiProvider  apiProvider;

  ListPage({@required this.apiProvider});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Products products;
  bool isLoading;
  List<Item> items;

  @override
  void initState() {
    isLoading = false;
    _getData();
    super.initState();
  }

  _getData() async{
     products = await widget.apiProvider.fetchData();
     items = products.items;
     setState(() {
       isLoading = true;
     });
  }

  _press(Item item){
    Navigator
        .push(context, MaterialPageRoute(
        builder: (context) => DitailPage(item: item,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.gray,
        centerTitle: true,
        title: Text("Список товаров",
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 17),
        ),),
      body: isLoading
          ? Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.55,
        crossAxisCount: 2,
        children: items.map((item) {
            return ItemCard(
              press: _press,
                item: item);
        }).toList(),
       ),
          )
          : Center(child: CircularProgressIndicator())
    );
  }
}
