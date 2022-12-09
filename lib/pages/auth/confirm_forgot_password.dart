import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/buttons.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/auth/register.dart';

class ConfirmForgotPasswordPage extends StatefulWidget {
  const ConfirmForgotPasswordPage({super.key});

  @override
  State<ConfirmForgotPasswordPage> createState() =>
      _ConfirmForgotPasswordPageState();
}

class _ConfirmForgotPasswordPageState extends State<ConfirmForgotPasswordPage> {
  final _resetCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  var _canBeClicked = true;

  void _onResetButtonPressed() async {
    setState(() {
      _canBeClicked = false;
    });

    if (_formKey.currentState!.validate()) {
      // "Do not use BuildContexts across async gaps" workaround
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final req = await Auth().confirmForgotPassword(
        _resetCodeController.text,
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
        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else if (req.statusCode == 400) {
        // show error message
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // throw an exception
        throw Exception("Unexpected status code: ${req.statusCode}");
      }
    }

    setState(() {
      _canBeClicked = true;
    });
  }

  void _onCancelButtonPressed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _onLoginButtonPressed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _onRegisterButtonPressed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  @override
  void dispose() {
    _resetCodeController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 29, 86),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Container(
                width: 350,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: const Text(
                        "iNotes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 87, 154, 226),
                        ),
                      ),
                    ),
                    const Text(
                      "Input the reset code that has been sent to your email address.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 2, 2, 2),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _resetCodeController,
                      label: 'Reset Code',
                      validator: (token) => resetCodeValidator(token),
                      prefixIcon: const Icon(Icons.lock_reset),
                    ),
                    const SizedBox(height: 10),
                    PasswordField(
                      controller: _newPasswordController,
                      isHidden: _isHidden,
                      label: 'New Password',
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    ConfirmPasswordField(
                      controller: _confirmNewPasswordController,
                      validator: (confirmNewPassword) =>
                          confirmPasswordValidator(
                        confirmNewPassword,
                        _newPasswordController.text,
                      ),
                      isHidden: _isHidden,
                      label: 'Confirm Password',
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    ButtonBlue(
                      label: "RESET PASSWORD",
                      onPressed: _canBeClicked ? _onResetButtonPressed : null,
                    ),
                    const SizedBox(height: 10),
                    ButtonBlueInverted(
                      label: "CANCEL",
                      onPressed: _onCancelButtonPressed,
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: 10),
                    ButtonBlue(
                      label: "LOGIN",
                      onPressed: _onLoginButtonPressed,
                    ),
                    const SizedBox(height: 10),
                    ButtonBlue(
                      label: "REGISTER",
                      onPressed: _onRegisterButtonPressed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
