import 'package:flutter/material.dart';
import 'package:module4_chapitre2/screens/page_c.dart';

class PageB extends StatelessWidget {
  final String title;

  const PageB({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page B: $title"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/c');
          },
          child: const Text(
            "Je suis sur le bouton B",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}