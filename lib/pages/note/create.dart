import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/components/shared/error_box.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/note.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/pages/note/list.dart';

class NoteCreatePage extends StatefulWidget {
  const NoteCreatePage({super.key});

  @override
  State<NoteCreatePage> createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  final _formKey = GlobalKey<FormState>();
  String error = "";

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteBodyController = TextEditingController();

  void _onAddNoteButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      final NavigatorState navigator = Navigator.of(context);
      final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

      final String? session = await Session.get();
      final req = await Note().createNote(
        session!,
        _noteTitleController.text,
        _noteBodyController.text,
      );
      final res = await jsonDecode(req.body);

      if (req.statusCode == 200) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(res['message']),
          ),
        );
        navigator.push(
          MaterialPageRoute(
            builder: (context) => const NoteListPage(),
          ),
        );
      } else {
        setState(() {
          error = res['message'];
        });
      }
    }
  }

  @override
  void dispose() {
    _noteTitleController.dispose();
    _noteBodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorDisplay =
        error.isNotEmpty ? ErrorBox(error: error) : Container();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 15,
              ),
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
            errorDisplay,
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: CustomTextField(
                label: "Title",
                controller: _noteTitleController,
                validator: (title) => noteTitleValidator(title),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: CustomTextField(
                label: "Body",
                controller: _noteBodyController,
                validator: (text) => noteBodyValidator(text),
                minLines: 5,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => _onAddNoteButtonPressed(),
            child: const Text('Add Note'),
          ),
        ),
      ),
    );
  }
}
