import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/buttons.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/functions.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/user.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/response.dart';

class ChangePasswordSection extends StatefulWidget {
  const ChangePasswordSection({super.key});

  @override
  State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  void _onChangePasswordButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final String? session = await Session.get();
      final req = await User().changePassword(
        session!,
        _currentPasswordController.text,
        _newPasswordController.text,
      );
      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
            backgroundColor: Colors.green,
          ),
        );
      } else if (req.statusCode == 401) {
        clearSessionThenRedirectToLogin(navigator, messenger);
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Change Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(height: 20),
            PasswordField(
              controller: _currentPasswordController,
              label: "Current Password",
              isHidden: _isHidden,
              onTap: () => setState(() => _isHidden = !_isHidden),
            ),
            const SizedBox(height: 15),
            PasswordField(
              controller: _newPasswordController,
              label: "New Password",
              isHidden: _isHidden,
              onTap: () => setState(() => _isHidden = !_isHidden),
            ),
            const SizedBox(height: 15),
            ConfirmPasswordField(
              controller: _confirmNewPasswordController,
              label: "Confirm New Password",
              isHidden: _isHidden,
              validator: (confirmNewPassword) => confirmPasswordValidator(
                confirmNewPassword,
                _newPasswordController.text,
              ),
              onTap: () => setState(() => _isHidden = !_isHidden),
            ),
            const SizedBox(height: 15),
            ButtonBlue(
              label: "Change Password",
              onPressed: _onChangePasswordButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
