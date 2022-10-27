import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';

class NoteEditPage extends StatefulWidget {
  const NoteEditPage({super.key});

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
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
                    child: Text("Update Note",
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
                    child: const Text('Update Note'),
                  ),
                )),
          ],
        )
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       const Text(
        //         'You have pushed the button this many times:',
        //       ),
        //       Text(
        //         '$_counter',
        //         style: Theme.of(context).textTheme.headline4,
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
        );
  }
}
