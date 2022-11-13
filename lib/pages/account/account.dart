import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/components/account/change_username.dart';
import 'package:inotes/components/account/change_password.dart';
import 'package:inotes/components/account/delete_account.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            ChangeUsernameSection(),
            ChangePasswordSection(),
            DeleteAccountSection(),
          ],
        ),
      ),
    );
  }
}
