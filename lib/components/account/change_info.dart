import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/functions.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/user.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/model/user.dart';

class ChangeInfoSection extends StatefulWidget {
  const ChangeInfoSection({super.key});

  @override
  State<ChangeInfoSection> createState() => _ChangeInfoSectionState();
}

class _ChangeInfoSectionState extends State<ChangeInfoSection> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  void _fetchUserInfo() async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final String? session = await Session.get();
    final req = await User().getInfo(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));
    final user = UserModel.fromJson(res.data);

    if (req.statusCode == 200) {
      _firstNameController.text = user.firstName ?? "";
      _lastNameController.text = user.lastName ?? "";
      _emailController.text = user.email;
    } else if (req.statusCode == 401) {
      clearSessionThenRedirectToLogin(navigator, messenger);
    } else {
      throw Exception("Error: ${res.message}");
    }
  }

  void _onUpdateInfoButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final String? session = await Session.get();
      final req = await User().updateInfo(
        session!,
        _emailController.text,
        _firstNameController.text,
        _lastNameController.text,
      );
      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
          ),
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
  }

  @override
  Widget build(BuildContext context) {
    _fetchUserInfo();

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Basic Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _firstNameController,
                    label: "First Name",
                    prefixIcon: const Icon(Icons.person),
                    validator: null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: _firstNameController,
                    label: "Last Name",
                    prefixIcon: const Icon(Icons.person),
                    validator: (lastName) => lastNameValidator(
                      lastName,
                      _firstNameController.text,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            EmailField(
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onUpdateInfoButtonPressed,
                child: const Text("Update Basic Information"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
