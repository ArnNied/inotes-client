import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inotes/cubit/session_cubit.dart';
import 'package:inotes/components/common/appbar.dart';

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({super.key});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
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
                      onPressed: () => Navigator.pushNamed(context, "/"),
                      child: const Text('Go to list'))
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.read<SessionCubit>().setSession("asd"),
      ),
    );
  }
}
