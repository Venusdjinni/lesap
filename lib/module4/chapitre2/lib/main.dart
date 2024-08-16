import 'package:flutter/material.dart';
import 'package:module4_chapitre2/screens/page_a.dart';
import 'package:module4_chapitre2/screens/page_b.dart';
import 'package:module4_chapitre2/screens/page_c.dart';

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
        //useMaterial3: true,
      ),
      initialRoute: '/a',
      routes: {
        '/a': (context) => const PageA(),
        '/b': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          if (arguments == null) {
            return const PageB();
          } else {
            return PageB(title: (arguments as Map)["title"]);
          }
        },
        '/c': (context) => const PageC(),
      },
    );
  }
}





