String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email harus diisi';
  }
  //validasi email
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());

  if (!regex.hasMatch(email)) {
    return "Email tidak valid";
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password harus diisi';
  }

  if (password.length < 8) {
    return 'Password minimal 8 karakter';
  }

  return null;
}

String? confirmPasswordValidator(String? confirmPassword, String password) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Password harus diisi';
  }

  if (confirmPassword != password) {
    return 'Password tidak sama';
  }

  return null;
}
