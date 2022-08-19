import 'dart:convert';

LoginResponse loginResponseJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.message,
    //required this.token,
    required this.userId,
    // required this.expirydate,
  });
  late final String message;
  //late final String token;
  late final String userId;
  //late final DateTime expirydate;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    //token = json['token'];
    userId = json['userId'];
    // expirydate = json['expirydate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    //_data['token'] = token;
    _data['userId'] = userId;
    //_data['expirydate'] = expirydate;
    return _data;
  }
}
