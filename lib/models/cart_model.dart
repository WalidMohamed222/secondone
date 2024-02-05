class CartModel {
  List<Cart>? carts;
  int? total;
  int? skip;
  int? limit;

  CartModel({
    this.carts,
    this.total,
    this.skip,
    this.limit,
  });

}

class Cart {
  int? id;
  List<Product>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Cart({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

}

class Product {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
  });

}
