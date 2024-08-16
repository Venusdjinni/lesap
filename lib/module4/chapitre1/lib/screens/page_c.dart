import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page C"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

          },
          child: Text("Je suis le bouton C"),
        ),
      ),
    );
  }
}