// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';
import 'package:inotes/model/note.dart';

enum Menu { itemEdit, itemDelete }

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({super.key});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;

    return Scaffold(
      appBar: CustomAppBar(
        actions: <Widget>[
          PopupMenuButton(
            // setState(() {});
            onSelected: (Menu menu) {
              if (menu == Menu.itemEdit) {
                Navigator.pushNamed(context, "/note/edit", arguments: note);
              } else if (menu == Menu.itemDelete) {
                // Delete
              }
            },
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
              note.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              note.body,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
