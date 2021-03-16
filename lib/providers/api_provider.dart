import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global/constants.dart';
import '../models/products.dart';

abstract class ApiProvider{
  Future<Products> fetchData();

}

class ApiProviderImp extends ApiProvider{

  @override
  Future<Products> fetchData() async {
    var response = await http.get(BASE_URL);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final products = Products.fromJson(responseBody);

      print('products: ${products.items[0].image}');
      return products;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


}