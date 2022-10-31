import 'package:flutter/material.dart';
import 'package:inotes/components/drawer.dart';
import 'package:inotes/components/common/appbar.dart';
import 'package:inotes/model/note.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final int _limitText = 500;

  List<Note> notes = [
    Note(
      id: "1",
      title: "Note 1",
      body:
          "😀😀😀Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit metus, fringilla eu leo tincidunt, congue aliquam orci. Integer placerat leo vitae sagittis mollis. In id risus ut neque lobortis placerat. In consequat pretium enim eget mollis. Vivamus vitae lorem at mi tincidunt tempus ac quis nisl. Maecenas vulputate a felis vel dictum. Nam at facilisis urna. Nam efficitur turpis at dictum placerat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit metus, fringilla eu leo tincidunt, congue aliquam orci. Integer placerat leo vitae sagittis mollis. In id risus ut neque lobortis placerat. In consequat pretium enim eget mollis. Vivamus vitae lorem at mi tincidunt tempus ac quis nisl. Maecenas vulputate a felis vel dictum. Nam at facilisis urna. Nam efficitur turpis at dictum placerat.",
      createdAt: 0,
      lastUpdated: 0,
    ),
    Note(
      id: "2",
      title: "Note 2",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit metus, fringilla eu leo tincidunt, congue aliquam orci. Integer placerat leo vitae sagittis mollis. In id risus ut neque lobortis placerat. In consequat pretium enim eget mollis. Vivamus vitae lorem at mi tincidunt tempus ac quis nisl. Maecenas vulputate a felis vel dictum. Nam at facilisis urna. Nam efficitur turpis at dictum placerat. ",
      createdAt: 0,
      lastUpdated: 0,
    ),
    Note(
      id: "3",
      title: "Note 3",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit metus, fringilla eu leo tincidunt, congue aliquam orci. Integer placerat leo vitae sagittis mollis. In id risus ut neque lobortis placerat. In consequat pretium enim eget mollis. Vivamus vitae lorem at mi tincidunt tempus ac quis nisl. Maecenas vulputate a felis vel dictum. Nam at facilisis urna. Nam efficitur turpis at dictum placerat. ",
      createdAt: 0,
      lastUpdated: 0,
    ),
    Note(
      id: "4",
      title: "Note 4",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit metus, fringilla eu leo tincidunt, congue aliquam orci. Integer placerat leo vitae sagittis mollis. In id risus ut neque lobortis placerat. In consequat pretium enim eget mollis. Vivamus vitae lorem at mi tincidunt tempus ac quis nisl. Maecenas vulputate a felis vel dictum. Nam at facilisis urna. Nam efficitur turpis at dictum placerat. ",
      createdAt: 0,
      lastUpdated: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: ListView.separated(
        itemCount: notes.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => Material(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            // customBorder harus sama dengan Material(borderRadius: ...)
            // UI akan inkonsisten jika tidak sama
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/note/detail",
                  arguments: notes[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notes[index].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Text(notes[index].body),
                  Text(notes[index].body.length >= _limitText
                      ? notes[index].body.substring(0, _limitText)
                      : notes[index].body),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 0, 92),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => context.read<SessionCubit>().setSession("asd"),
        onPressed: () => {
          Navigator.pushNamed(context, "/note/create"),
        },
        tooltip: 'Create Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
