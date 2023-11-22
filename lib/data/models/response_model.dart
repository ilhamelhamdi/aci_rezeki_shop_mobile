class ResponseModel {
  final dynamic status;
  final String? message;

  ResponseModel({required this.status, this.message});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
