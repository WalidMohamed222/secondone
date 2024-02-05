class CartItem {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;
  String? thumbnail;
  int? productId;

  CartItem({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
    this.productId,
  });
  factory CartItem.fromProduct(product, int quantity) {
    return CartItem(
      id: product.id,
      title: product.title,
      price: product.price,
      quantity: quantity,
      total: product.price! * quantity,
      discountPercentage: product.discountPercentage,
      discountedPrice: product.discountedPrice,
      thumbnail: product.thumbnail,
      productId: product.id,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    quantity: json["quantity"],
    total: json["total"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    discountedPrice: json["discountedPrice"],
    thumbnail: json["thumbnail"],
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "total": total,
    "discountPercentage": discountPercentage,
    "discountedPrice": discountedPrice,
    "thumbnail": thumbnail,
    "productId": productId,
  };
}