import 'package:flutter/material.dart';
import 'package:module4_chapitre2/screens/page_b.dart';
import 'package:module4_chapitre2/screens/page_c.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Page A"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/b',
              arguments: {
                "title": "Eric"
              }
            );
          },
          child: const Text("CLIQUE ICI"),
        ),
      ),
    );
  }
}