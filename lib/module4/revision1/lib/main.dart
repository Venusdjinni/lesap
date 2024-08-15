import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/status_cubit.dart';
import 'package:revisions1/screens/status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const primaryColor = Color(0xFF075E54);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewStatusCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: primaryColor
          ),
          useMaterial3: true,
        ),
        home: const StatusPage(),
      ),
    );
  }
}

