import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inotes/components/shared/buttons.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/auth/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  var _canBeClicked = true;

  void _onRegisterButtonClick() async {
    setState(() {
      _canBeClicked = false;
    });

    if (_formKey.currentState!.validate()) {
      // "Do not use BuildContexts across async gaps" workaround
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final req = await Auth().register(
        _emailController.text,
        _passwordController.text,
      );

      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 201) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text("Registration successful! Please login."),
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
        throw Exception(
            "Unexpected status code: ${req.statusCode} ${res.message}");
      }
    }

    setState(() {
      _canBeClicked = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      isHidden: _isHidden,
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    ConfirmPasswordField(
                      controller: _confirmPasswordController,
                      validator: (confirmPassword) => confirmPasswordValidator(
                        confirmPassword,
                        _passwordController.text,
                      ),
                      isHidden: _isHidden,
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    ButtonBlue(
                        label: "REGISTER",
                        onPressed:
                            _canBeClicked ? _onRegisterButtonClick : null),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
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
