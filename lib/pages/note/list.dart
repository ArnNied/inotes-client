import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inotes/cubit/session_cubit.dart';
import 'package:inotes/components/common/appbar.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/note/detail.dart';
import 'package:inotes/pages/note/create.dart';

// import 'package:inotes/widgets/sidebar.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: UserAccountsDrawerHeader(
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
            title: Text("Home"),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.settings), //Ini Icon
            title: Text("Settings"),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.info), //Ini Icon
            title: Text("About Us"),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.logout), //Ini Icon
            title: Text("Logout"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ]),
      ),
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoteDetailPage()));
            },
            child: AbsorbPointer(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 200,
                    // color: Color.fromARGB(255, 255, 255, 255), // tidak boleh disini
                    padding:
                        const EdgeInsets.only(left: 15, top: 10), //jarak teks
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),

                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // judul catatan
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            // isi catatan
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
            },
            child: AbsorbPointer(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 200,
                    // color: Color.fromARGB(255, 255, 255, 255), // tidak boleh disini
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // judul catatan
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            // isi catatan
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
            },
            child: AbsorbPointer(
              // child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 200,
                    // color: Color.fromARGB(255, 255, 255, 255), // tidak boleh disini
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),

                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // judul catatan
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            // isi catatan
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
            },
            child: AbsorbPointer(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 200,
                    // color: Color.fromARGB(255, 255, 255, 255), // tidak boleh disini
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),

                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // judul catatan
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            // isi catatan
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Phasellus vel tristique nunc, fringilla interdum urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eget leo feugiat est suscipit imperdiet. Fusce convallis justo tristique varius placerat. Suspendisse placerat in nisl imperdiet varius. Morbi tincidunt risus est, ut ullamcorper nulla viverra sit amet.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 25, 0, 92),
      // body: BlocBuilder<SessionCubit, String>(
      //   builder: ((context, state) => Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             const Text(
      //               'You have pushed the button this many times:',
      //             ),
      //             Text(
      //               state,
      //               style: Theme.of(context).textTheme.headline4,
      //             ),
      //             TextButton(
      //                 onPressed: () =>
      //                     Navigator.pushNamed(context, "/note/detail"),
      //                 child: const Text('Go to detail'))
      //           ],
      //         ),
      //       )),
      // ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => context.read<SessionCubit>().setSession("asd"),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteCreatePage()))
        },
        tooltip: 'Create Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
