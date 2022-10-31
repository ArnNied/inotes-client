import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';

class NoteCreatePage extends StatefulWidget {
  const NoteCreatePage({super.key});

  @override
  State<NoteCreatePage> createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: <Widget>[
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
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //       color: Color.fromARGB(255, 0, 174, 255), width: 2.0),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //       color: Color.fromARGB(255, 0, 174, 255), width: 2.0),
                // ),
                // labelText: 'Content',
              ),
            ),
          ),
          // Container(
          //     padding: const EdgeInsets.only(left: 10, right: 10),
          //     child: SizedBox(
          //       width: 5,
          //       child: ElevatedButton(
          //         onPressed: () {},
          //         child: const Text('Add Note'),
          //       ),
          //     )),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:Container(
          height: 50,
          child: SizedBox(
              width: 5,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Note'),
              ),
          ),
        ),
      ),
    );
  }
}
