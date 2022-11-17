import 'package:flutter/material.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/note/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        primarySwatch: const MaterialColor(0xFF579AE2, {
          50: Color(0xffabcdf1),
          100: Color(0xff9ac2ee),
          200: Color(0xff89b8eb),
          300: Color(0xff79aee8),
          400: Color(0xff68a4e5),
          500: Color(0xff579AE2),
          600: Color(0xff4e8bcb),
          700: Color(0xff467bb5),
          800: Color(0xff3d6c9e),
          900: Color(0xff345c88),
        }),
        fontFamily: 'Poppins',
      ),
      home: const NoteListPage(),
    );
  }
}
