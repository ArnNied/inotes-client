import 'package:flutter/material.dart';
import 'package:inotes/model/user.dart';
import 'package:inotes/pages/account/account.dart';
import 'package:inotes/pages/auth/login.dart';

class CustomDrawer extends StatelessWidget {
  final UserModel user;

  const CustomDrawer({super.key, required this.user});

  void _onLogoutButtonPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _onMyAccountButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyAccountPage(),
      ),
    );
  }

  void _onAboutUsButtonPressed(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: const Text('About Us'),
    //       content: const Text('iNotes is a simple note-taking app.'),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: const Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: UserAccountsDrawerHeader(
              arrowColor: const Color.fromARGB(255, 255, 255, 255),
              accountName: Text(user.firstName != null && user.lastName != null
                  ? '${user.firstName} ${user.lastName}'
                  : "-"),
              accountEmail: Text(user.email),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage(
              //       'assets/image/ricardo.jpg'), //atur dulu di pubspec.yaml
              // ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/ubuntu-20.04-wallpaper.png'),
                ), //atur dulu di pubspec.yaml
              ),
              // child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.settings),
            title: const Text("My Account"),
            onTap: () => _onMyAccountButtonPressed(context),
          ),
          ListTile(
            trailing: const Icon(Icons.info),
            title: const Text("About Us"),
            onTap: () => _onAboutUsButtonPressed(context),
          ),
          ListTile(
            trailing: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => _onLogoutButtonPressed(context),
          ),
        ],
      ),
    );
  }
}
