import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/statuses_states.dart';
import 'package:revisions1/models/status.dart';

class NewStatusCubit extends Cubit<NewStatusState> {
  NewStatusCubit() : super(NewStatusEditingState([], ""));

  void editText(String text) {
    final currentState = this.state;

    if (currentState is NewStatusEditingState) {
      final newState = NewStatusEditingState(currentState.statuses, text);

      emit(newState);
    } else {
      // je ne fais rien
    }
  }

  void saveStatus() {
    final currentState = this.state;

    if (currentState is NewStatusEditingState) {
      if ((currentState as NewStatusEditingState).input != "") {
        emit(NewStatusSavingState());
        try {
          // enregistrer
          final newStatus = Status(
              content: currentState.input,
              creationDate: DateTime.now(),
              viewsCount: Random().nextInt(50)
          );

          final newState = NewStatusEditingState(
              [
                newStatus,
                ...currentState.statuses
              ],
              ""
          );
          emit(NewStatusSavedState(newStatus));
          emit(newState);
        } catch (error, trace) {
          emit(NewStatusErrorState(error, trace));
          emit(currentState);
        }
      } else {
        // je ne fais rien
      }
    }
  }
}