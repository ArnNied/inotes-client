import 'package:flutter/material.dart';
import 'package:inotes/core/validators.dart';

class CustomTextField extends TextFormField {
  CustomTextField({
    super.key,
    required TextEditingController controller,
    required String label,
    required String? Function(String?)? validator,
    bool obscureText = false,
    int? maxLines = 1,
    int? minLines,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) : super(
          obscureText: obscureText,
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: label,
            labelText: label,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 87, 154, 226), width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 87, 154, 226), width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade500, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade500, width: 2.0),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        );
}

class EmailField extends CustomTextField {
  EmailField({
    Key? key,
    required TextEditingController controller,
  }) : super(
          key: key,
          controller: controller,
          label: "E-mail",
          validator: (email) => emailValidator(email),
          prefixIcon: const Icon(Icons.email),
        );
}

class PasswordField extends CustomTextField {
  PasswordField({
    Key? key,
    required TextEditingController controller,
    required bool isHidden,
    required void Function() onTap,
    String? Function(String?)? validator,
    String label = "Password",
  }) : super(
          key: key,
          label: label,
          controller: controller,
          obscureText: isHidden,
          validator: validator ?? (password) => passwordValidator(password),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        );
}

class ConfirmPasswordField extends PasswordField {
  ConfirmPasswordField({
    Key? key,
    required TextEditingController controller,
    required bool isHidden,
    required void Function() onTap,
    required String actualPassword,
    String label = "Confirm Password",
  }) : super(
          key: key,
          label: label,
          controller: controller,
          validator: (password) =>
              confirmPasswordValidator(password, actualPassword),
          isHidden: isHidden,
          onTap: onTap,
        );
}
