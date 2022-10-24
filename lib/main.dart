import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inotes/pages/auth/forgot_password.dart';
import 'package:inotes/pages/auth/login.dart';
import 'package:inotes/pages/auth/register.dart';
import 'package:inotes/pages/note/create.dart';
import 'package:inotes/pages/note/detail.dart';
import 'package:inotes/pages/note/edit.dart';
import 'package:inotes/pages/note/list.dart';
import 'package:inotes/pages/profile.dart';

import 'cubit/session_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SessionCubit>(
        create: (BuildContext context) => SessionCubit(),
      ),
    ],
    child: const MyApp(),
  ));
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
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const NoteListPage(),
        "/note/detail": (context) => const NoteDetailPage(),
        "/note/create": (context) => const NoteCreatePage(),
        "/note/edit": (context) => const NoteEditPage(),
        "/auth/login": (context) => const LoginPage(),
        "/auth/register": (context) => const RegisterPage(),
        "/auth/forgot-password": (context) => const ForgotPasswordPage(),
        "/profile": (context) => const ProfilePage(),
      },
    );
  }
}