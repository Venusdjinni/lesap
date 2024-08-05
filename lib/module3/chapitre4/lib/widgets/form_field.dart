import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module3_chapitre4/bloc/data_cubit.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({super.key});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late final dataCubit = context.read<DataCubit>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        autofocus: true,
        controller: nameController,
        initialValue: dataCubit.state.input,
        decoration: const InputDecoration(
          hintText: "Nom de l'interlocuteur"
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.words,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        onChanged: (String value) {
          dataCubit.changeText(value);
        },
        onEditingComplete: () {
          dataCubit.addConversation();
          nameController.text = '';
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
