import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/status_cubit.dart';
import 'package:revisions1/bloc/statuses_states.dart';
import 'package:revisions1/screens/new_status.dart';
import 'package:revisions1/widgets/item_status.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("My status"),
      ),
      body: ListView(
        children: [
          BlocBuilder<NewStatusCubit, NewStatusState>(
            builder: (context, state) {
              if (state is NewStatusEditingState) {
                if (state.statuses.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Text(
                      "Aucun statut enregistré",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return ListView.builder(
                  itemBuilder: (_, i) => StatusItem(status: state.statuses[i]),
                  itemCount: state.statuses.length,
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                );
              } else if (state is NewStatusInitializingState) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: CircularProgressIndicator()
                );
              } else if (state is NewStatusErrorState) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Text("Une erreur est survenue"),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const Divider(thickness: 0.2),
          Row(
            children: [
              const SizedBox(width: 16.0),
              const Icon(Icons.lock_outlined),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: "Your status updates are "),
                      TextSpan(
                        text: "end-to-end encrypted",
                        style: TextStyle(color: Theme.of(context).primaryColor)
                      ),
                      const TextSpan(text: " They will disappear after 24h")
                    ]
                  ),
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 16.0)
            ],
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const NewStatusPage(),
                fullscreenDialog: true
              ));
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.camera_alt_outlined),
          )
        ],
      ),
    );
  }
}
