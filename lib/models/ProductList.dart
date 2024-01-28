class ProductList {
  String? status;
  List<Details>? details;

  ProductList({this.status, this.details});

  ProductList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? name;
  String? productCode;
  String? slug;
  String? category;
  String? categorySlug;
  String? categoryImage;
  String? brand;
  String? brandSlug;
  String? brandImage;
  String? productImage;
  String? description;
  String? shortDescription;
  String? price;
  int? stock;
  String? isRent;

  Details(
      {this.name,
      this.productCode,
      this.slug,
      this.category,
      this.categorySlug,
      this.categoryImage,
      this.brand,
      this.brandSlug,
      this.brandImage,
      this.productImage,
      this.description,
      this.shortDescription,
      this.price,
      this.stock,
      this.isRent});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productCode = json['product_code'];
    slug = json['slug'];
    category = json['category'];
    categorySlug = json['category_slug'];
    categoryImage = json['category_image'];
    brand = json['brand'];
    brandSlug = json['brand_slug'];
    brandImage = json['brand_image'];
    productImage = json['product_image'];
    description = json['description'];
    shortDescription = json['short_description'];
    price = json['price'];
    stock = json['stock'];
    isRent = json['isRent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['product_code'] = this.productCode;
    data['slug'] = this.slug;
    data['category'] = this.category;
    data['category_slug'] = this.categorySlug;
    data['category_image'] = this.categoryImage;
    data['brand'] = this.brand;
    data['brand_slug'] = this.brandSlug;
    data['brand_image'] = this.brandImage;
    data['product_image'] = this.productImage;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['isRent'] = this.isRent;
    return data;
  }
}
