import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/note.dart';
import 'package:inotes/model/note.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/note/edit.dart';
import 'package:inotes/pages/note/list.dart';

enum Menu { itemEdit, itemDelete }

class NoteDetailPage extends StatefulWidget {
  final NoteModel note;

  const NoteDetailPage({super.key, required this.note});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  void _handlePopUpMenuOption(Menu menu) {
    if (menu == Menu.itemEdit) {
      _onMenuItemEditPressed();
    } else if (menu == Menu.itemDelete) {
      _onMenuItemDeletePressed();
    }
  }

  void _onMenuItemEditPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteEditPage(note: widget.note)),
    );
  }

  void _onMenuItemDeletePressed() async {
    final NavigatorState navigator = Navigator.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

    final String? session = await Session.get();
    final req = await Note().deleteNote(session!, widget.note.id);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(res.message),
        ),
      );

      navigator.push(
        MaterialPageRoute(builder: (context) => const NoteListPage()),
      );
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Failed to delete note: ${res.message}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: <Widget>[
          PopupMenuButton(
            // setState(() {});
            onSelected: (Menu menu) => _handlePopUpMenuOption(menu),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemEdit,
                child: Text('Edit'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemDelete,
                child: Text('Delete'),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              widget.note.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              widget.note.body,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
