import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';
import 'package:inotes/model/note.dart';

class NoteEditPage extends StatefulWidget {
  const NoteEditPage({super.key});

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
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
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              initialValue: note.title,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 174, 255),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              initialValue: note.body,
              minLines: 5,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 174, 255),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Update Note'),
          ),
        ),
      ),
    );
  }
}
