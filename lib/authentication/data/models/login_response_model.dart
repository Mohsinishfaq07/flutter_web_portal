class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.statusCode,
  });
  late final String message;
  late final String accessToken;
  late final String refreshToken;
  late final int statusCode;

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['access_token'] = accessToken;
    _data['refresh_token'] = refreshToken;
    _data['statusCode'] = statusCode;
    return _data;
  }
}