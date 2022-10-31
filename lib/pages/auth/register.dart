import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 0, 92),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
                    child: TextFormField(
                      // maxLines: 1, lebar textformfield
                      decoration: const InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 174, 255),
                                width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 174, 255),
                                width: 2.0),
                          ),
                          hintText: 'E-mail'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 174, 255),
                                width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 174, 255),
                                width: 2.0),
                          ),
                          hintText: 'Password'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 174, 255),
                              width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 174, 255),
                              width: 2.0),
                        ),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      height: 30,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/auth/register',
                          );
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
                                Navigator.pushNamed(
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
    );
  }
}
