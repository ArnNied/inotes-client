import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inotes/core/functions.dart';
import 'package:inotes/core/session.dart';
import 'package:inotes/core/user.dart';
import 'package:inotes/model/response.dart';
import 'package:inotes/model/user.dart';
import 'package:inotes/pages/account/account.dart';
import 'package:inotes/pages/auth/login.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late Future<UserModel> user;

  Future<UserModel> _fetchUserInfo() async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final String? session = await Session.get();
    final req = await User().getInfo(session!);
    final res = ResponseModel.fromJson(jsonDecode(req.body));

    if (req.statusCode == 200) {
      return UserModel.fromJson(res.data);
    } else if (req.statusCode == 401) {
      clearSessionThenRedirectToLogin(navigator, messenger);

      return UserModel(email: "");
    } else {
      throw Exception('Failed to load user info');
    }
  }

  void _onLogoutButtonPressed() async {
    final navigator = Navigator.of(context);

    await Session.clear();

    navigator.pop();
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
  }

  void _onMyAccountButtonPressed() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyAccountPage(),
      ),
    );
  }

  // void _onAboutUsButtonPressed() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('About Us'),
  //         content: const Text('iNotes is a simple note-taking app.'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    user = _fetchUserInfo();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: FutureBuilder(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return UserAccountsDrawerHeader(
                    arrowColor: const Color.fromARGB(255, 255, 255, 255),
                    accountName: Text(snapshot.data?.firstName != null &&
                            snapshot.data?.lastName != null
                        ? '${snapshot.data?.firstName} ${snapshot.data?.lastName}'
                        : "-"),
                    accountEmail: Text(snapshot.data!.email),
                    // currentAccountPicture: CircleAvatar(
                    //   backgroundImage: AssetImage(
                    //       'assets/image/ricardo.jpg'), //atur dulu di pubspec.yaml
                    // ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/image/ubuntu-20.04-wallpaper.png'),
                      ), //atur dulu di pubspec.yaml
                    ),
                    // child: Text('Drawer Header'),
                  );
                } else {
                  return const UserAccountsDrawerHeader(
                    arrowColor: const Color.fromARGB(255, 255, 255, 255),
                    accountName: Text("-"),
                    accountEmail: Text("-"),
                    // currentAccountPicture: CircleAvatar(
                    //   backgroundImage: AssetImage(
                    //       'assets/image/ricardo.jpg'), //atur dulu di pubspec.yaml
                    // ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/image/ubuntu-20.04-wallpaper.png'),
                      ), //atur dulu di pubspec.yaml
                    ),
                    // child: Text('Drawer Header'),
                  );
                }
              },
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.settings),
            title: const Text("My Account"),
            onTap: () => _onMyAccountButtonPressed(),
          ),
          // ListTile(
          //   trailing: const Icon(Icons.info),
          //   title: const Text("About Us"),
          //   onTap: () => _onAboutUsButtonPressed(),
          // ),
          ListTile(
            trailing: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => _onLogoutButtonPressed(),
          ),
        ],
      ),
    );
  }
}
