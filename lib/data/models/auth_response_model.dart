class AuthResponseModel {
  final bool status;
  final String message;
  final String? username;

  AuthResponseModel({
    required this.status,
    required this.message,
    this.username,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      message: json['message'],
      username: json['username'],
    );
  }
}
