import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';

class ChangePasswordSection extends StatefulWidget {
  const ChangePasswordSection({super.key});

  @override
  State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 15, left: 10),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text("Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
          ),
          Container(
            width: null,
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
            child: PasswordField(
              controller: _oldPasswordController,
              label: "Old Password",
              isHidden: _isHidden,
              onTap: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
          ),
          Container(
            width: null,
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
            child: PasswordField(
              controller: _newPasswordController,
              label: "New Password",
              isHidden: _isHidden,
              onTap: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
          ),
          Container(
            width: null,
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
            child: ConfirmPasswordField(
              controller: _confirmNewPasswordController,
              label: "Confirm New Password",
              isHidden: _isHidden,
              actualPassword: _newPasswordController.text,
              onTap: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  var validate = _formKey.currentState?.validate();
                  if (validate == true) {
                    // _onLoginButtonClick();
                  }
                },
                child: const Text("Change Password"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
