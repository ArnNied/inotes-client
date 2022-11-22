import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/core/functions.dart';
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteEditPage(note: widget.note),
      ),
    );
  }

  void _onMenuItemDeletePressed() async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final String? session = await Session.get();
    final req = await Note().deleteNote(session!, widget.note.id);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(res.message),
          backgroundColor: Colors.green,
        ),
      );

      navigator.push(
        MaterialPageRoute(
          builder: (context) => const NoteListPage(),
        ),
      );
    } else if (req.statusCode == 401) {
      clearSessionThenRedirectToLogin(navigator, messenger);
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Failed to delete note: ${res.message}'),
          backgroundColor: Colors.red,
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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: <Widget>[
          Text(
            widget.note.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(height: 5),
          Text(
            "Last updated: ${formatDate(widget.note.lastUpdated)}",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.note.body,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
