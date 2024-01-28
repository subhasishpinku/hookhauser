// ignore_for_file: unnecessary_this

class RemoveCart {
  String? productId;
  String? qty;

  RemoveCart({this.productId, this.qty});

  RemoveCart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    return data;
  }
}