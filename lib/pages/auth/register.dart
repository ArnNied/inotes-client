import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';
import 'package:inotes/pages/auth/login.dart';

import 'package:inotes/pages/note/list.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                          // maxLines: 1, lebar textformfield
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
                              hintText: 'Confirm Password'),
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
                            child: const Text('REGISTER'),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: new RichText(
                              text: new TextSpan(
                            children: [
                              new TextSpan(
                                text: 'Already have an account? ',
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              new TextSpan(
                                  text: 'Login',
                                  style: new TextStyle(color: Colors.blue),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    })
                            ],
                          ))

                          // child: new InkWell(
                          //   onTap: () => {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => LoginPage()))
                          //   },
                          //   child: new Text(
                          //     "Login",
                          //     style: TextStyle(
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.bold,
                          //         color: Color.fromARGB(255, 0, 174, 255)),
                          //   ),
                          // )
                          ),
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
