import 'package:flutter/material.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/pages/auth/login.dart';

void clearSessionThenRedirectToLogin(
  NavigatorState navigator,
  ScaffoldMessengerState messenger,
) async {
  await Session.clear();
  messenger.showSnackBar(
    const SnackBar(
      content: Text("Invalid session! Please log in again."),
    ),
  );

  navigator.pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
    (route) => false,
  );
}

String formatDate(int unixTimestamp) {
  final dt = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

  return dt.toString().split('.').first;
}
