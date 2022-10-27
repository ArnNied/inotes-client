import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';

class NoteCreatePage extends StatefulWidget {
  const NoteCreatePage({super.key});

  @override
  State<NoteCreatePage> createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: ListView(
          children: <Widget>[
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: TextField(
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Title',
            //     ),
            //   ),
            // ),
            Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 15,
                ),
                child: Center(
                    child: Text("Add Note",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )))),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                maxLines: 20,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 174, 255), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 174, 255), width: 2.0),
                  ),
                  // labelText: 'Content',
                  hintText: 'Content',
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  width: 5,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Note'),
                  ),
                )),
          ],
        ));
  }
}
