import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inotes/cubit/session_cubit.dart';
import 'package:inotes/components/common/appbar.dart';

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
      appBar: const CustomAppBar(),
      body: BlocBuilder<SessionCubit, String>(
        builder: ((context, state) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/note/detail"),
                      child: const Text('Go to detail'))
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<SessionCubit>().setSession("asd"),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
