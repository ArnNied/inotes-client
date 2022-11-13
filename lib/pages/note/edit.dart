import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/components/shared/error_box.dart';
import 'package:inotes/components/shared/textfield.dart';
import 'package:inotes/core/note.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/validators.dart';
import 'package:inotes/model/note.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/note/list.dart';

class NoteEditPage extends StatefulWidget {
  final NoteModel note;

  const NoteEditPage({super.key, required this.note});

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final _formKey = GlobalKey<FormState>();
  String error = "";

  final _noteTitleController = TextEditingController();
  final _noteBodyController = TextEditingController();

  void _onUpdateNoteButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      final NavigatorState navigator = Navigator.of(context);
      final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

      final String? session = await Session.get();
      final req = await Note().updateNote(
        session!,
        widget.note.id,
        _noteTitleController.text,
        _noteBodyController.text,
      );
      final res = ResponseModel.fromJson(jsonDecode(req.body));

      if (req.statusCode == 200) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(res.message),
          ),
        );

        navigator.push(MaterialPageRoute(
          builder: (context) => const NoteListPage(),
        ));
      } else {
        setState(() {
          error = res.message;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // Input field initial value
    _noteTitleController.text = widget.note.title;
    _noteBodyController.text = widget.note.body;
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
                  "Update Note",
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
            onPressed: () => _onUpdateNoteButtonPressed(),
            child: const Text('Update Note'),
          ),
        ),
      ),
    );
  }
}
