class UserModel {
  final String email;
  String? firstName;
  String? lastName;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
