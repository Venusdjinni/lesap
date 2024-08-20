import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/statuses_states.dart';
import 'package:revisions1/models/status.dart';
import 'package:revisions1/services/status_service.dart';

class NewStatusCubit extends Cubit<NewStatusState> {
  final StatusService statusService;

  NewStatusCubit(this.statusService) : super(NewStatusInitializingState()) {
    statusService.getAllStatuses().then(
      (list) {
        emit(NewStatusEditingState(list, ""));
      },
      onError: (error, trace) {
        print('$error, $trace');
        emit(NewStatusErrorState(error, trace));
      }
    );
  }

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
        statusService.createStatus(currentState.input).then(
          (newStatus) {
            final newState = NewStatusEditingState(
              [
                newStatus,
                ...currentState.statuses
              ],
              ""
            );
            emit(NewStatusSavedState(newStatus));
            emit(newState);
          },
          onError: (error, trace) {
            emit(NewStatusErrorState(error, trace));
            emit(currentState);
          }
        );
      } else {
        // je ne fais rien
      }
    }
  }
}