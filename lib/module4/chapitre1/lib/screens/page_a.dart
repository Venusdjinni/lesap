import 'package:flutter/material.dart';
import 'package:module4_chapitre1/screens/page_b.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page A"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const PageB()
            ));
          },
          child: Text("CLIQUE ICI"),
        ),
      ),
    );
  }
}