// // To parse this JSON data, do
// //
// //     final registration = registrationFromJson(jsonString);
// import 'dart:convert';

// UserModel registrationFromJson(String str) =>
//     UserModel.fromJson(json.decode(str));
// String registrationToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   int? id;
//   String? name;
//   String? email;
//   String? mobile;
//   String? address;
//   String? emailVerifiedAt;
//   String? password;
//   String? role;
//   dynamic status;
//   String? image;
//   dynamic created_at;
//   dynamic updated_at;

//   UserModel({
//     this.id,
//     this.name,
//     this.email,
//     this.mobile,
//     this.address,
//     this.emailVerifiedAt,
//     this.password,
//     this.role,
//     this.status,
//     this.image,
//     this.created_at,
//     this.updated_at,
//   });

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "mobile": mobile,
//         "address": address,
//         "email_verified_at": emailVerifiedAt,
//         "password": password,
//         "role": role,
//         "status": status,
//         "image": image,
//         "created_at": created_at,
//         "updated_at": updated_at,
//       };

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["id"] ?? "",
//         name: json["name"] ?? "",
//         email: json["email"] ?? "",
//         mobile: json["mobile"] ?? "",
//         address: json["address"] ?? "",
//         emailVerifiedAt: json["email_verified_at"] ?? "",
//         password: json["password"] ?? "",
//         role: json["role"] ?? "",
//         status: json["status"] ?? false,
//         image: json["image"] ?? "",
//         created_at: json['created_at'] ?? "",
//         updated_at: json['updated_at'] ?? "",
//       );
// }

class UserModel {
  String? status;
  dynamic id;
  String? name;
  String? message;
  String? accessToken;
  String? tokenType;
  String? expiresAt;

  UserModel(
      {this.status,
      this.id,
      this.name,
      this.message,
      this.accessToken,
      this.tokenType,
      this.expiresAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    name = json['name'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['name'] = this.name;
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
