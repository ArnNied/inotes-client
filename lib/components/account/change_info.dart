import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';
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
    final String? session = await Session.get();
    final req = await User().getInfo(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));
    final user = UserModel.fromJson(res.data);

    if (req.statusCode == 200) {
      _firstNameController.text = user.firstName ?? "";
      _lastNameController.text = user.lastName ?? "";
      _emailController.text = user.email;
    }
  }

  void _onUpdateInfoButtonPressed() async {
    if (_formKey.currentState!.validate()) {
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
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                        child: CustomTextField(
                          controller: _firstNameController,
                          label: 'First Name',
                          validator: null,
                          prefixIcon: const Icon(Icons.person),
                        )),
                  ),
                ),
                Container(
                  width: null,
                  child: Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: CustomTextField(
                          controller: _lastNameController,
                          label: 'Last Name',
                          validator: (lastName) => lastNameValidator(
                              lastName, _firstNameController.text),
                          prefixIcon: const Icon(Icons.person),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: null,
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: EmailField(
              controller: _emailController,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onUpdateInfoButtonPressed,
                child: const Text("Update Basic Information"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
