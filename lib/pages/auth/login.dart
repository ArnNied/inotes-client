import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:inotes/components/common/appbar.dart';

import 'package:inotes/pages/note/list.dart';
import 'package:inotes/pages/auth/register.dart';
import 'package:inotes/pages/auth/forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.only(
                  // top: 250,
                  // // bottom: 250,
                  // left: 50,
                  // right: 50,
                  ),
              child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(const Radius.circular(5))),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text("iNotes",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 174, 255)))),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
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
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
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
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: SizedBox(
                          height: 30,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoteListPage()));
                            },
                            child: const Text('LOGIN'),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: new InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()))
                            },
                            child: new Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 174, 255)),
                            ),
                          )),
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
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()))
                            },
                            child: const Text('REGISTER'),
                          ),
                        ),
                      )
                    ],
                  )))),
      backgroundColor: Color.fromARGB(255, 25, 0, 92),
      // appBar: const CustomAppBar(),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
