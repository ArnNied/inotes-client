import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/components/account/change_username.dart';
import 'package:inotes/components/account/change_password.dart';
import 'package:inotes/components/account/delete_account.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
