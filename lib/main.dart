import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_state_mangement/state_manegement/counter_state_mangment.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeAnimationStyle: AnimationStyle.noAnimation,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 69, 30, 136),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    log('Counter : ${ref.read(counterprovider).toString()}');
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 34, 7, 151),

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('You have pushed the button this many times:'),
            SizedBox(height: 15),
            Text(
              /*
              i will see or update ui every time the user press on the button, i will build ui in this case
              */
              ref.watch(counterprovider).toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                if (ref.read(counterprovider) == 0) {
                  showDialog(
                    context: context,
                    builder: (builder) => AlertDialog(
                      title: Text("Feild"),
                      content: Text("the counter is 0 now"),
                    ),
                  );
                } else {
                  ref.read(counterprovider.notifier).downCount();
                }
              },
              child: Text("DownCounter"),
            ),
            SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                /* Here we can read or Know The value by 'read' i will read the value and update the ui for every time
             i press on this button 
                */
                ref.read(counterprovider.notifier).resetCount();
              },
              child: Text("Reset Counter "),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterprovider.notifier).increment();
        },

        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
