import 'package:flutter/material.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/model/note.dart';
import 'package:inotes/pages/note/edit.dart';

enum Menu { itemEdit, itemDelete }

class NoteDetailPage extends StatefulWidget {
  final NoteModel note;

  const NoteDetailPage({super.key, required this.note});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: <Widget>[
          PopupMenuButton(
            // setState(() {});
            onSelected: (Menu menu) {
              if (menu == Menu.itemEdit) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteEditPage(note: widget.note),
                  ),
                );
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
