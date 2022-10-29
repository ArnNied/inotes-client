import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inotes/cubit/session_cubit.dart';
import 'package:inotes/components/common/appbar.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/note/detail.dart';
import 'package:inotes/pages/note/create.dart';
import 'package:inotes/model/note.dart';
import 'package:inotes/pages/account/profile.dart';

// import 'package:inotes/widgets/sidebar.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<Note> notes = [
    Note(
      id: "1",
      title: "Note 1",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit metus, fringilla eu leo tincidunt, congue aliquam orci. Integer placerat leo vitae sagittis mollis. In id risus ut neque lobortis placerat. In consequat pretium enim eget mollis. Vivamus vitae lorem at mi tincidunt tempus ac quis nisl. Maecenas vulputate a felis vel dictum. Nam at facilisis urna. Nam efficitur turpis at dictum placerat. ",
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
    // List<Widget> notesList = notes
    //     .map(
    //       (note) => GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(context, "/note/detail", arguments: note);
    //         },
    //         // child: AbsorbPointer(
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               margin: const EdgeInsets.only(top: 5, bottom: 5),
    //               // height: 200,
    //               // color: Color.fromARGB(255, 255, 255, 255), // tidak boleh disini
    //               padding:
    //                   const EdgeInsets.only(left: 15, top: 10), //jarak teks
    //               decoration: BoxDecoration(
    //                   color: Color.fromARGB(255, 255, 255, 255),
    //                   borderRadius:
    //                       BorderRadius.all(const Radius.circular(10))),

    //               child: Container(
    //                 child: Column(
    //                   children: <Widget>[
    //                     Container(
    //                       // judul catatan
    //                       alignment: Alignment.topLeft,
    //                       child: Text(
    //                         note.title,
    //                         style: TextStyle(
    //                             fontSize: 23, fontWeight: FontWeight.bold),
    //                       ),
    //                     ),
    //                     Container(
    //                       // isi catatan
    //                       alignment: Alignment.bottomLeft,
    //                       margin: const EdgeInsets.only(top: 10, bottom: 10),
    //                       child: Text(
    //                         note.body,
    //                         style: TextStyle(fontSize: 13),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         // ),
    //       ),
    //     )
    //     .toList();

    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const UserAccountsDrawerHeader(
              // child: DrawerHeader(
              arrowColor: Color.fromARGB(255, 255, 255, 255),
              // accountName: Text('My Account'),
              accountName: Text('Ricardo Milos'),
              accountEmail: Text('RicardoMilos@Undead.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/image/ricardo.jpg'), //atur dulu di pubspec.yaml
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    // image: NetworkImage(
                    // 'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                    image: AssetImage(
                        'assets/image/ubuntu-20.04-wallpaper.png')), //atur dulu di pubspec.yaml
              ),
              // child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.home), //Ini Icon
            title: const Text("Home"),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.settings), //Ini Icon
            title: const Text("My Account"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.info), //Ini Icon
            title: const Text("About Us"),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.logout), //Ini Icon
            title: const Text("Logout"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
        ]),
      ),
      appBar: const CustomAppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: notes.length,
        padding: const EdgeInsets.all(8),
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
                children: [
                  Text(
                    notes[index].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(notes[index].body)
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
