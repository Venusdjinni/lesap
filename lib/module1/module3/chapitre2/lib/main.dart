import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module3_chapitre2/widgets/form_field.dart';
import 'package:module3_chapitre2/widgets/item_conversation.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  final conversations = <String>[];

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
          CustomFormField(
            onTextValidated: (String conversation) {
              setState(() {
                conversations.add(conversation);
              });
            },
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => ConversationItem(
                name: conversations[i],
                onDeleteTap: () {
                  setState(() {
                    conversations.remove(conversations[i]);
                  });
                },
              ),
              itemCount: conversations.length,
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
