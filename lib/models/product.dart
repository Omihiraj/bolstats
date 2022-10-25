class Product {
  String productImg;
  String productId;
  String productName;
  double productPrice;
  int productQty;
  Product(
      {required this.productName,
      required this.productId,
      required this.productImg,
      required this.productPrice,
      required this.productQty});

  static Product fromJson(json) => Product(
      productName: json['pname'],
      productId: json['pid'],
      productImg: json['pimg'],
      productPrice: json['pprice'],
      productQty: json['pqty']);
}
