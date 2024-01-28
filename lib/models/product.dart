import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.productId,
        this.productName,
        this.productPrice,
        this.productImageUrl,
        this.count,
    });

    String? productId;
    String? productName;
    String? productPrice;
    String? productImageUrl;
    int? count;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productImageUrl: json["product_image_url"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "product_image_url": productImageUrl,
        "count": count,
    };
}

