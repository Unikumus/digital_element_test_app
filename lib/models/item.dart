import '../mixins/check_double.dart';

class Item  with CheckDouble {
  int id;
  String name;
  double price;
  String article;
  String image;

  Item({this.id, this.name, this.price, this.article, this.image});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = convertToDouble(json['price'] ?? 0);
    article = json['article'];
    image = json['image'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['article'] = article;
    data['image'] = image;
    return data;
  }
}
