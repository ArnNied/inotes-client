import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _onRegisterButtonClick() async {
    // "Do not use BuildContexts across async gaps" workaround
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final req = await Auth().register(
      _emailController.text,
      _passwordController.text,
    );

    Map<String, dynamic> res = jsonDecode(req.body);

    if (req.statusCode == 200) {
      navigator.pushReplacementNamed("/auth/login");
    } else if (req.statusCode == 201 ||
        req.statusCode == 400 ||
        req.statusCode == 404) {
      // show error message
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(res["message"]),
        ),
      );
    } else {
      // throw an exception
      throw Exception("Unexpected status code: ${req.statusCode}");
    }
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
      backgroundColor: const Color.fromARGB(255, 25, 0, 92),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text("iNotes",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 174, 255)))),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 10),
                      child: EmailField(
                        controller: _emailController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 10),
                      child: PasswordField(
                        controller: _passwordController,
                        isHidden: _isHidden,
                        onTap: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 10),
                      child: ConfirmPasswordField(
                        controller: _confirmPasswordController,
                        actualPassword: _passwordController.text,
                        isHidden: _isHidden,
                        onTap: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            var validate = _formKey.currentState?.validate();
                            if (validate == true) {
                              _onRegisterButtonClick();
                            }
                          },
                          child: const Text('REGISTER'),
                        ),
                      ),
                    ),
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
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/auth/login',
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
