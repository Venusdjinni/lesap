import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/status_cubit.dart';
import 'package:revisions1/bloc/statuses_states.dart';
import 'package:revisions1/screens/new_status.dart';

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
            buildWhen: (previous, current) {
              return current is NewStatusEditingState;
            },
            builder: (context, state) {
              if (state is NewStatusEditingState) {
                return Text(
                  "${state.statuses.length}",
                  style: const TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          /*ListView.builder(
            itemBuilder: (_, i) => ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              title: Text("0 views"),
              subtitle: Text("Just now"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            itemCount: 2,
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
          ),*/
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
