import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/components/shared/drawer.dart';
import 'package:inotes/components/shared/appbar.dart';
import 'package:inotes/core/functions.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/note.dart';
import 'package:inotes/model/note.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/pages/note/create.dart';
import 'package:inotes/pages/note/detail.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final int _limitText = 500;

  late Future<List<NoteModel>> notes;

  Future<List<NoteModel>> _fetchUserNotes() async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

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
    } else if (req.statusCode == 401) {
      clearSessionThenRedirectToLogin(navigator, messenger);

      return [];
    } else {
      throw Exception('Failed to load user notes');
    }
  }

  // navigate to note detail page with the selected note
  void _onNotePressed(NoteModel note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteDetailPage(note: note),
      ),
    );
  }

  // navigate to note create page
  void _onFloatingButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NoteCreatePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notes = _fetchUserNotes();

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: notes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () => _onNotePressed(snapshot.data![index]),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Last Updated: ${formatDate(snapshot.data![index].lastUpdated)}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              snapshot.data![index].body.length > _limitText
                                  ? "${snapshot.data![index].body.substring(0, _limitText)}..."
                                  : snapshot.data![index].body,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
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
      backgroundColor: const Color.fromARGB(255, 39, 29, 86),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingButtonPressed,
        tooltip: 'Create Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
