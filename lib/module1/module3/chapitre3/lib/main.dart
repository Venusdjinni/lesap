import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Pizza {
  int a;

  Pizza(this.a);
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Pizza> preparerPizza() async {
    await Future.delayed(const Duration(seconds: 5));
    return Pizza(10);
  }

  Stream<String> obtenirCommandes() async* {
    final menu = ['Pizza', 'Omelette', 'Steak'];

    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: Random().nextInt(5) + 1));
      yield menu[Random().nextInt(menu.length)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: obtenirCommandes(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.active:
                return Text(
                  snapshot.data!,
                  style: TextStyle(fontSize: 40),
                );
              case ConnectionState.done:
                return Text("DONE");
            }
          },
        ),
      ),
    );
  }
}
