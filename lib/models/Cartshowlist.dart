// ignore_for_file: unnecessary_this, unnecessary_new
class Cartshowlist {
  List<CartList>? cartList;
  String? status;

  Cartshowlist({this.cartList, this.status});

  Cartshowlist.fromJson(Map<String, dynamic> json) {
    if (json['cart_list'] != null) {
      cartList = <CartList>[];
      json['cart_list'].forEach((v) {
        cartList!.add(new CartList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartList != null) {
      data['cart_list'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class CartList {
  dynamic pid;
  String? name;
  String? price;
  String? image;

  CartList({this.pid, this.name, this.price, this.image});

  CartList.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
