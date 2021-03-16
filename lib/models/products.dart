import 'item.dart';

class Products{
  List<Item> items;

  Products({this.items});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items =  <Item>[];
      json['items'].forEach((v) {
        items.add( Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

