import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revisions1/models/status.dart';

class StatusItem extends StatelessWidget {
  final Status status;

  const StatusItem({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Center(
          child: Text(
            status.content.substring(0, min(20, status.content.length)),
            style: const TextStyle(fontSize: 8.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      title: Text("${status.viewsCount} views"),
      subtitle: Text(status.creationDate.toString()),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
