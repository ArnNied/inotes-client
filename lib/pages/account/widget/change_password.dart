import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 15, left: 10),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text("Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
          ),
          Container(
            width: null,
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8),
                hintText: "Old Password",
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
            width: null,
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8),
                hintText: "Password",
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
            width: null,
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8),
                hintText: "Confirm Password",
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
                  child: const Text("Change Password"),
                ),
              )),
        ],
      ),
    );
  }
}
