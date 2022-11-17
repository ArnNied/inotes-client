import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/core/functions.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/user.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/auth/login.dart';

class DeleteAccountSection extends StatefulWidget {
  const DeleteAccountSection({super.key});

  @override
  State<DeleteAccountSection> createState() => _DeleteAccountSectionState();
}

class _DeleteAccountSectionState extends State<DeleteAccountSection> {
  void _onConfirmDeleteAccountButtonPressed() async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final String? session = await Session.get();
    final req = await User().deleteAccount(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(res.message),
        ),
      );

      navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false,
      );
    } else if (req.statusCode == 401) {
      clearSessionThenRedirectToLogin(navigator, messenger);
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text(res.message),
        ),
      );
    }
  }

  void warningDelete() {
    AlertDialog alert = AlertDialog(
      title: const Text("Are you Sure?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      content: const Text(
          "This is the final step of your account deletion. This action is permanent and irreversible."),
      actions: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(153, 255, 0, 0),
                  ),
                  child: const Text("CANCEL"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onConfirmDeleteAccountButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    side: const BorderSide(
                        width: 2.0, color: Color.fromARGB(153, 255, 0, 0)),
                    shadowColor: null,
                  ),
                  child: const Text(
                    "CONFIRM",
                    style: TextStyle(
                        color: Color.fromARGB(153, 255, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 30, bottom: 15, left: 10),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text("Account Deletion",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
                "By clicking this button you acknowledged that every single data concerning you (this includes notes, email, password, and full name) will be deleted permanently and cannot be reversed.",
                style: TextStyle(fontSize: 15)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {warningDelete()},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(153, 255, 0, 0),
              ),
              child: const Text("DELETE MY ACCOUNT"),
            ),
          ),
        ),
      ],
    );
  }
}
