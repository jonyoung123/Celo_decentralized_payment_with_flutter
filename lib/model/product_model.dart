class ProductModel {
  String? productName;
  String? productPrice;
  String? productUrl;

  ProductModel({
    this.productName,
    this.productPrice,
    this.productUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'] as String?;
    productPrice = json['productPrice'] as String?;
    productUrl = json['productUrl'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['productName'] = productName;
    json['productPrice'] = productPrice;
    json['productUrl'] = productUrl;
    return json;
  }
}
