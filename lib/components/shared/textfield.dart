import 'package:flutter/material.dart';
import 'package:inotes/core/validators.dart';

class CustomTextField extends TextFormField {
  CustomTextField({
    super.key,
    required TextEditingController controller,
    required String label,
    required String? Function(String?)? validator,
    bool obscureText = false,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) : super(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: label,
            labelText: label,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 174, 255), width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 174, 255), width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade500, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade500, width: 2.0),
            ),
            prefixIcon: Icon(prefixIcon),
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
          prefixIcon: Icons.person,
        );
}

class PasswordField extends CustomTextField {
  PasswordField({
    Key? key,
    required TextEditingController controller,
    required bool isHidden,
    required void Function() onTap,
  }) : super(
          key: key,
          label: "Password",
          controller: controller,
          obscureText: isHidden,
          validator: (password) => passwordValidator(password),
          prefixIcon: Icons.lock,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              isHidden ? Icons.visibility : Icons.visibility_off,
              // color: Color.fromARGB(255, 0, 174, 255),
            ),
          ),
        );
}

class ConfirmPasswordField extends CustomTextField {
  ConfirmPasswordField({
    Key? key,
    required TextEditingController controller,
    required bool isHidden,
    required String actualPassword,
    required void Function() onTap,
  }) : super(
          key: key,
          label: "Confirm Password",
          controller: controller,
          obscureText: isHidden,
          validator: (password) =>
              confirmPasswordValidator(password, actualPassword),
          prefixIcon: Icons.lock,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              isHidden ? Icons.visibility : Icons.visibility_off,
              // color: Color.fromARGB(255, 0, 174, 255),
            ),
          ),
        );
}
