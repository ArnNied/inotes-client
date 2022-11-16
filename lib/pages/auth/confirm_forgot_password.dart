import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/auth/forgot_password.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/auth/register.dart';

class ConfirmForgotPasswordPage extends StatefulWidget {
  const ConfirmForgotPasswordPage({super.key});

  @override
  State<ConfirmForgotPasswordPage> createState() =>
      _ConfirmForgotPasswordPageState();
}

class _ConfirmForgotPasswordPageState extends State<ConfirmForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final _resetCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _onResetButtonPressed() async {
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
          ),
        );
        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else if (req.statusCode == 400 || req.statusCode == 404) {
        // show error message
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
          ),
        );
      } else {
        // throw an exception
        throw Exception("Unexpected status code: ${req.statusCode}");
      }
    }
  }

  @override
  void dispose() {
    _resetCodeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                      child: const Text(
                        "iNotes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 174, 255),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text(
                        "Input the reset code that has been sent to your email address.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 5,
                      ),
                      child: CustomTextField(
                        controller: _resetCodeController,
                        label: 'Reset Code',
                        validator: (token) => resetCodeValidator(token),
                        prefixIcon: const Icon(Icons.lock_reset),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      child: PasswordField(
                        controller: _newPasswordController,
                        isHidden: _isHidden,
                        label: 'New Password',
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
                        actualPassword: _newPasswordController.text,
                        isHidden: _isHidden,
                        label: 'Confirm Password',
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
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _onResetButtonPressed,
                          child: const Text('RESET PASSWORD'),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 0, 174, 255),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 0, 174, 255)),
                            ),
                          ),
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            )
                          },
                          child: const Text('LOGIN'),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            )
                          },
                          child: const Text('REGISTER'),
                        ),
                      ),
                    )
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
