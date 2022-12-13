import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/buttons.dart';
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
  var _canBeClicked = true;

  void _onConfirmDeleteAccountButtonPressed() async {
    setState(() {
      _canBeClicked = false;
    });

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final String? session = await Session.get();
    final req = await User().deleteAccount(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      await Session.clear();

      messenger.showSnackBar(
        SnackBar(
          content: Text(res.message),
          backgroundColor: Colors.green,
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
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _canBeClicked = true;
    });
  }

  void warningDelete() {
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Are you Sure?",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      content: const Text(
          "This is the final step of your account deletion. This action is permanent and irreversible."),
      actions: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ButtonRed(
                  label: "CANCEL",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonRedInverted(
                  label: "CONFIRM",
                  onPressed: _canBeClicked
                      ? _onConfirmDeleteAccountButtonPressed
                      : null,
                ),
              ),
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
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Account Deletion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "By clicking this button you acknowledge that every single data concerning you (this includes notes, email, password, and full name) will be deleted permanently and cannot be reversed.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 15),
          ButtonRed(label: "DELETE MY ACCOUNT", onPressed: warningDelete),
        ],
      ),
    );
  }
}
