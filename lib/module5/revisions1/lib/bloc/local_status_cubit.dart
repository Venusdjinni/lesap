import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/statuses_states.dart';
import 'package:revisions1/services/local_status_service.dart';

class LocalNewStatusCubit extends Cubit<NewStatusState> {
  final LocalStatusService localStatusService;

  LocalNewStatusCubit(this.localStatusService) : super(NewStatusInitializingState()) {
    localStatusService.getAllStatuses().then(
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
    final currentState = state;

    if (currentState is NewStatusEditingState) {
      final newState = NewStatusEditingState(currentState.statuses, text);

      emit(newState);
    } else {
      // je ne fais rien
    }
  }

  void saveStatus() {
    final currentState = state;

    if (currentState is NewStatusEditingState) {
      if ((currentState).input != "") {
        emit(NewStatusSavingState());
        localStatusService.createStatus(currentState.input).then(
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