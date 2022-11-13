class ResponseModel {
  final String message;
  final dynamic data;

  ResponseModel({
    required this.message,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'],
      data: json['data'],
    );
  }
}
