String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email cannot be empty';
  }
  //validasi email
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());

  if (!regex.hasMatch(email)) {
    return "Invalid Email";
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password cannot be empty';
  }

  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }

  return null;
}

String? confirmPasswordValidator(String? confirmPassword, String password) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Password cannot be empty';
  }

  if (confirmPassword != password) {
    return 'Password does not match';
  }

  return null;
}

String? noteTitleValidator(String? noteTitle) {
  if (noteTitle == null || noteTitle.isEmpty) {
    return 'Title cannot be empty';
  }
  if (noteTitle.length > 255) {
    return 'Title cannot be longer than 255 characters';
  }

  return null;
}

String? noteBodyValidator(String? noteBody) {
  if (noteBody == null || noteBody.isEmpty) {
    return 'Body cannot be empty';
  }

  return null;
}

String? resetCodeValidator(String? token) {
  if (token!.isEmpty) {
    return 'Reset code cannot be empty';
  }

  if (token.length != 6) {
    return 'Invalid reset code';
  }

  return null;
}

String? lastNameValidator(String? lastName, String firstName) {
  if (lastName!.isNotEmpty && firstName.isEmpty) {
    return 'Fill out the first name field first';
  }

  return null;
}
