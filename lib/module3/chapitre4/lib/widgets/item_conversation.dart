import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module3_chapitre4/bloc/data_cubit.dart';

class ConversationItem extends StatelessWidget {
  final String name;

  const ConversationItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final dataCubit = context.read<DataCubit>();

    return ListTile(
      onTap: () {
        dataCubit.deleteConversation(name);
      },
      leading: CircleAvatar(),
      title: Text(name),
      subtitle: Text("Lorem ipsum dolor sit amet consecutur..."),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
