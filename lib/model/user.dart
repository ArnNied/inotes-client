class UserModel {
  final String email;
  final String? firstName;
  final String? lastName;

  UserModel({
    required this.email,
    this.firstName,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
