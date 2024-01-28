class RegistrationModel {
  String? status;
  String? name;
  String? message;
  String? accessToken;
  String? tokenType;
  String? expiresAt;

  RegistrationModel(
      {this.status,
      this.name,
      this.message,
      this.accessToken,
      this.tokenType,
      this.expiresAt});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['name'] = this.name;
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
