import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/error_box.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String error = "";

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLoginButtonClick() async {
    // "Do not use BuildContexts across async gaps" workaround
    final navigator = Navigator.of(context);

    final req = await Auth().login(
      _emailController.text,
      _passwordController.text,
    );

    Map<String, dynamic> res = jsonDecode(req.body);

    if (req.statusCode == 200) {
      navigator.pushReplacementNamed("/");
    } else if (req.statusCode == 400 || req.statusCode == 404) {
      // show error message
      setState(() {
        error = res["message"];
      });
    } else {
      // throw an exception
      setState(() {
        error = "Unexpected status code: ${req.statusCode}";
      });
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
    final errorDisplay = error != "" ? ErrorBox(error: error) : Container();

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
                            var validate = _formKey.currentState?.validate();
                            if (validate == true) {
                              _onLoginButtonClick();
                            }
                          },
                          child: const Text('LOGIN'),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth/forgot-password');
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
                            Navigator.pushNamed(
                              context,
                              '/auth/register',
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
