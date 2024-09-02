import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/sigin_states.dart';
import 'package:revisions1/bloc/signin_cubit.dart';
import 'package:revisions1/screens/status.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "My Status",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 64.0),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInLoggedState) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const StatusPage()
                  ));
                } else if (state is SignInErrorState) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: const Text("Une erreur est survenue"),
                      actions: [
                        TextButton(
                          onPressed: Navigator.of(context).pop,
                          child: const Text("fermer"),
                        )
                      ],
                    )
                  );
                }
              },
              builder: (context, state) {
                if (state is SignInInitializingState) {
                  return const CircularProgressIndicator();
                } else {
                  return OutlinedButton.icon(
                    onPressed: () {
                      final cubit = context.read<SignInCubit>();
                      cubit.signIn();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48.0,
                        vertical: 16.0
                      )
                    ),
                    icon: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png",
                      height: 24.0,
                      width: 24.0,
                    ),
                    label: const Text("Se connecter avec Google"),
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
