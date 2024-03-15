import 'package:firstly/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            BlocBuilder<CounterBloc, int>(builder: (context, counter) {
              return Text(
                '$counter',
              );
            }),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterIncremented());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterDecremented());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
          ],
        ));
  }
}
