import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  final String name;
  final VoidCallback onDeleteTap;

  const ConversationItem({
    super.key,
    required this.name,
    required this.onDeleteTap
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primaryContainer: Colors.orange
        )
      ),
      child: ListTile(
        onTap: () {
          onDeleteTap();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$name supprimé"))
          );
        },
        leading: CircleAvatar(),
        title: Text(name),
        subtitle: Text("Lorem ipsum dolor sit amet consecutur..."),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
