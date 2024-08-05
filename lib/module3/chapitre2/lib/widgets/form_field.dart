import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final ValueChanged<String> onTextValidated;

  const CustomFormField({super.key, required this.onTextValidated});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: nameController,
        decoration: const InputDecoration(
          hintText: "Nom de l'interlocuteur"
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.words,
        onEditingComplete: () {
          setState(() {
            widget.onTextValidated(nameController.text);
            nameController.text = '';
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Veuillez donner un nom";
          } else {
            return null;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
