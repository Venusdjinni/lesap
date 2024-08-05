import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module3_chapitre4/bloc/data_cubit.dart';
import 'package:module3_chapitre4/models/conversations.dart';
import 'package:module3_chapitre4/widgets/form_field.dart';
import 'package:module3_chapitre4/widgets/item_conversation.dart';

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
      home: BlocProvider<DataCubit>(
        create: (_) => DataCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const CustomFormField(),
          const SizedBox(height: 16.0),
          BlocListener<DataCubit, Data>(
            listenWhen: (Data oldState, Data newState) => oldState.names.length > newState.names.length,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Élément supprimé"),
              ));
            },
            child: BlocBuilder<DataCubit, Data>(
              builder: (context, data) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, i) => ConversationItem(
                      name: data.names[i],
                    ),
                    itemCount: data.names.length,
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
