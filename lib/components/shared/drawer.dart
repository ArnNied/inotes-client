import 'package:flutter/material.dart';
import 'package:inotes/model/user.dart';
import 'package:inotes/pages/account/profile.dart';
import 'package:inotes/pages/auth/login.dart';

class CustomDrawer extends StatelessWidget {
  final UserModel user;

  const CustomDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: UserAccountsDrawerHeader(
            // child: DrawerHeader(
            arrowColor: const Color.fromARGB(255, 255, 255, 255),
            // accountName: Text('My Account'),
            // accountName: Text('Ricardo Milos'),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
