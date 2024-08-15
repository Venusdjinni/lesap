import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/status_cubit.dart';
import 'package:revisions1/bloc/statuses_states.dart';

class NewStatusPage extends StatefulWidget {
  const NewStatusPage({super.key});

  @override
  State<NewStatusPage> createState() => _NewStatusPageState();
}

class _NewStatusPageState extends State<NewStatusPage> {
  late final newStatusCubit = context.read<NewStatusCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewStatusCubit, NewStatusState>(
      listener: (context, state) {
        if (state is NewStatusSavedState) {
          Navigator.of(context).pop();
        } else if (state is NewStatusErrorState) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Erreur"),
              content: Text(state.error.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Fermer"),
                )
              ],
            )
          );
        }
      },
      child: Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
            foregroundColor: Colors.white
          )
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.emoji_emotions_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.text_fields),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.palette_outlined),
              ),
            ],
          ),
          backgroundColor: Colors.blueGrey,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Ecrivez un statut",
                      hintStyle: TextStyle(
                        fontSize: 32.0
                      )
                    ),
                    minLines: 1,
                    maxLines: 10,
                    onChanged: (value) {
                      newStatusCubit.editText(value);
                    },
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32.0
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Colors.black
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.track_changes,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            "Status (Contacts)",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      heroTag: '',
                      onPressed: () {
                        newStatusCubit.saveStatus();
                      },
                      elevation: 0,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.send),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
