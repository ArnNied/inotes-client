import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text("Basic Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
          ),
          Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: null,
                  child: Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "First Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 174, 255),
                                width: 2.0
                                // height: 50,
                                ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 174, 255),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: null,
                  child: Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Last Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 174, 255),
                                width: 2.0
                                // height: 50,
                                ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 174, 255),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: null,
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 174, 255), width: 2.0
                      // height: 50,
                      ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 174, 255),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Update Basic Information"),
                ),
              )),
        ],
      ),
    );
  }
}
