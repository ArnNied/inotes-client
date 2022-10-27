// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inotes/cubit/session_cubit.dart';
// import 'package:inotes/components/common/appbar.dart';

import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/note/edit.dart';

enum Menu { itemEdit, itemDelete }

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({super.key});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iNotes', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        actions: <Widget>[
          PopupMenuButton(
            // setState(() {});
            onSelected: (Menu menu) {
              if (menu == Menu.itemEdit) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoteEditPage()));
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
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Title',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              'Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          // Padding(padding: const EdgeInsets.all(10)),
          // const Text(
          //   'Title',
          //   style: TextStyle(fontSize: 20),
          // ),
          // const Text(
          //   'Content',
          //   style: TextStyle(fontSize: 20),
          // ),
        ],
      ),
    );
  }
}
