import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Nom d'utilisateur",
                ),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                onEditingComplete: () {
                  Focus.of(context).nextFocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Champ obligatoire";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Mot de passe"
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onEditingComplete: () {
                  Focus.of(context).unfocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Champ obligatoire";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  final bool formIsOkay = formKey.currentState?.validate() ?? false;

                  if (formIsOkay) {
                    // envoie les données au serveur
                    print('username = ${usernameController.text}');
                    print('password = ${passwordController.text}');
                  }
                },
                child: Text("Se connecter"),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}


