class EmailCheack {
  String? message;
  Users? users;
  String? status;

  EmailCheack({this.message, this.users, this.status});

  EmailCheack.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    users = json['users'] != null ?  Users.fromJson(json['users']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? emailVerifiedAt;
  String? role;
  String? wishList;
  String? cartList;
  String? walletBalance;
  String? status;
  String? image;
  String? wstreet;
  String? warea;
  String? wcity;
  String? wdistrict;
  String? wstate;
  String? wpin;
  String? astreet;
  String? aarea;
  String? acity;
  String? adistrict;
  String? astate;
  String? apin;
  String? createdAt;
  String? updatedAt;
  String? otp;

  Users(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.emailVerifiedAt,
      this.role,
      this.wishList,
      this.cartList,
      this.walletBalance,
      this.status,
      this.image,
      this.wstreet,
      this.warea,
      this.wcity,
      this.wdistrict,
      this.wstate,
      this.wpin,
      this.astreet,
      this.aarea,
      this.acity,
      this.adistrict,
      this.astate,
      this.apin,
      this.createdAt,
      this.updatedAt,
      this.otp});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    wishList = json['wish_list'];
    cartList = json['cart_list'];
    walletBalance = json['wallet_balance'];
    status = json['status'];
    image = json['image'];
    wstreet = json['wstreet'];
    warea = json['warea'];
    wcity = json['wcity'];
    wdistrict = json['wdistrict'];
    wstate = json['wstate'];
    wpin = json['wpin'];
    astreet = json['astreet'];
    aarea = json['aarea'];
    acity = json['acity'];
    adistrict = json['adistrict'];
    astate = json['astate'];
    apin = json['apin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['wish_list'] = this.wishList;
    data['cart_list'] = this.cartList;
    data['wallet_balance'] = this.walletBalance;
    data['status'] = this.status;
    data['image'] = this.image;
    data['wstreet'] = this.wstreet;
    data['warea'] = this.warea;
    data['wcity'] = this.wcity;
    data['wdistrict'] = this.wdistrict;
    data['wstate'] = this.wstate;
    data['wpin'] = this.wpin;
    data['astreet'] = this.astreet;
    data['aarea'] = this.aarea;
    data['acity'] = this.acity;
    data['adistrict'] = this.adistrict;
    data['astate'] = this.astate;
    data['apin'] = this.apin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['otp'] = this.otp;
    return data;
  }
}