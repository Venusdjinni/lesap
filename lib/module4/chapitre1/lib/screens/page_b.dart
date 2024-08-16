import 'package:flutter/material.dart';
import 'package:module4_chapitre1/screens/page_c.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page B"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PageC()),
            );
          },
          child: Text(
            "Je suis sur le bouton B",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}