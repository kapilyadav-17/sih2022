class LoginRequest {
  LoginRequest({
    required this.userId,
    required this.password,
    required this.userRole,
  });
  late final String userId;
  late final String password;
  late final int userRole;
  LoginRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    password = json['password'];
    userRole = json['userRole'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['password'] = password;
    _data['userRole'] = userRole;
    return _data;
  }
}
