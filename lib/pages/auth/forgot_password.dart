import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/buttons.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/auth/confirm_forgot_password.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/auth/register.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  void _onResetButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final req = await Auth().forgotPassword(_emailController.text);
      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text('A reset code has been sent to your email'),
            backgroundColor: Colors.green,
          ),
        );

        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ConfirmForgotPasswordPage(),
          ),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(
            content:
                Text('Failed to send password reset email: ${res.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
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
    _emailController.dispose();
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
                      "We will reset your account's password and send you an email containing the new password. Please change your password after you log in",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 2, 2, 2),
                      ),
                    ),
                    const SizedBox(height: 20),
                    EmailField(
                      controller: _emailController,
                    ),
                    const SizedBox(height: 15),
                    ButtonBlue(
                      label: "RESET",
                      onPressed: _onResetButtonPressed,
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
