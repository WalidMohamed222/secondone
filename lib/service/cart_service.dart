import 'package:secondone/models/cart_model.dart';

class CartService {
  static final List<CartItem> _cartProducts = [];

  static Future<void> addToCart(CartItem product, int quantity) async {
    product.quantity = quantity;
    _cartProducts.add(product);
  }

  static List<CartItem> getCartProducts() {
    return List.from(_cartProducts);
  }
}