import 'package:flutter/material.dart';
import 'package:module4_chapitre1/screens/page_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
        ),
        home: const PageA(),
      ),
    );
  }
}





