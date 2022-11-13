import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/drawer.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/user.dart';
import 'package:inotes/core/note.dart';
import 'package:inotes/model/note.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/model/user.dart';
import 'package:inotes/pages/note/create.dart';
import 'package:inotes/pages/note/detail.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final int _limitText = 500;

  late Future<UserModel> user;
  late Future<List<NoteModel>> notes;

  Future<UserModel> _fetchUserInfo() async {
    final String? session = await Session.get();
    final req = await User().getInfo(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      return UserModel.fromJson(res.data);
    } else {
      throw Exception('Failed to load user info');
    }
  }

  Future<List<NoteModel>> _fetchUserNotes() async {
    final String? session = await Session.get();
    final req = await Note().getNotes(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      List<NoteModel> temp = res.data.map<NoteModel>((note) {
        return NoteModel.fromJson(note);
      }).toList();

      // Sort by last updated
      temp.sort((a, b) => b.lastUpdated.compareTo(a.lastUpdated));
      return temp;
    } else {
      throw Exception('Failed to load user notes');
    }
  }

  // navigate to note detail page with the selected note
  void _onNotePressed(NoteModel note) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetailPage(note: note)),
    );
  }

  // navigate to note create page
  void _onFloatingButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NoteCreatePage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    user = _fetchUserInfo();
    notes = _fetchUserNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomDrawer(user: snapshot.data!);
          } else {
            return const SizedBox();
          }
        },
      ),
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: notes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.all(5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(snapshot.data![index].body.length >
                              _limitText
                          ? "${snapshot.data![index].body.substring(0, _limitText)}..."
                          : snapshot.data![index].body),
                      onTap: () => _onNotePressed(snapshot.data![index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Text>[
                    Text(
                      "You don't have any notes yet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      "Create one by clicking the button below.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 25, 0, 92),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFloatingButtonPressed(),
        tooltip: 'Create Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
