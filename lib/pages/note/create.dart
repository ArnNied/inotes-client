import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/components/shared/buttons.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/functions.dart';
import 'package:inotes/core/note.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/note/list.dart';

class NoteCreatePage extends StatefulWidget {
  const NoteCreatePage({super.key});

  @override
  State<NoteCreatePage> createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  final _noteTitleController = TextEditingController();
  final _noteBodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _canBeClicked = true;

  void _onAddNoteButtonPressed() async {
    setState(() {
      _canBeClicked = false;
    });

    if (_formKey.currentState!.validate()) {
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      final String? session = await Session.get();
      final req = await Note().createNote(
        session!,
        _noteTitleController.text,
        _noteBodyController.text,
      );
      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200 || req.statusCode == 201) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
            backgroundColor: Colors.green,
          ),
        );
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const NoteListPage(),
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
    }

    setState(() {
      _canBeClicked = true;
    });
  }

  @override
  void dispose() {
    _noteTitleController.dispose();
    _noteBodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "Add Note",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CustomTextField(
              label: "Title",
              controller: _noteTitleController,
              validator: (title) => noteTitleValidator(title),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Body",
              controller: _noteBodyController,
              validator: (text) => noteBodyValidator(text),
              minLines: 5,
              maxLines: null,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ButtonBlue(
            label: "Add Note",
            height: 50,
            onPressed: _canBeClicked ? _onAddNoteButtonPressed : null),
      ),
    );
  }
}
