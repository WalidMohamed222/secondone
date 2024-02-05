import 'package:dio/dio.dart';
import 'package:secondone/models/cart_model.dart';
import 'package:secondone/network_settings.dart';

class CartService {
  static final dio = Dio();

  static Future<List<Cart>> getProductsData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}carts");
    var data = response.data;
    CartModel productsModel = CartModel.fromJson(data);

    return productsModel.carts ?? [];
  }
}