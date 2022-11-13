import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/error_box.dart';
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
  String error = "";

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginButtonClick() async {
    if (_formKey.currentState!.validate()) {
      // "Do not use BuildContexts across async gaps" workaround
      final NavigatorState navigator = Navigator.of(context);
      final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

      final req = await Auth().login(
        _emailController.text,
        _passwordController.text,
      );

      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200) {
        Session.set(res.data["session"]);

        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
          ),
        );

        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const NoteListPage(),
          ),
        );
      } else if (req.statusCode == 400) {
        // show error message
        setState(() {
          error = res.message;
        });
      } else {
        // throw an exception
        setState(() {
          error = "Unexpected status code: ${req.statusCode}";
        });
      }
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
    // Display error if there is one
    final errorDisplay =
        error.isNotEmpty ? ErrorBox(error: error) : Container();

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
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                    errorDisplay,
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: EmailField(
                        controller: _emailController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: PasswordField(
                        controller: _passwordController,
                        isHidden: _isHidden, //hidden password
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
                            _onLoginButtonClick();
                          },
                          child: const Text('LOGIN'),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 174, 255)),
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
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                            ),
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
