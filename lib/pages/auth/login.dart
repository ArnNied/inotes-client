import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/buttons.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/auth/forgot_password.dart';
import 'package:inotes/pages/auth/register.dart';
import 'package:inotes/pages/note/list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      // "Do not use BuildContexts across async gaps" workaround
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final req = await Auth().login(
        _emailController.text,
        _passwordController.text,
      );

      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200) {
        await Session.set(res.data["session"]);

        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
            backgroundColor: Colors.green,
          ),
        );

        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const NoteListPage(),
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
  }

  void _onForgotPasswordButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordPage(),
      ),
    );
  }

  void _onRegisterButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    EmailField(
                      controller: _emailController,
                    ),
                    const SizedBox(height: 15),
                    PasswordField(
                      controller: _passwordController,
                      isHidden: _isHidden, //hidden password
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    ButtonBlue(
                      label: "LOGIN",
                      onPressed: _onLoginButtonPressed,
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: _onForgotPasswordButtonPressed,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 87, 154, 226),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
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
