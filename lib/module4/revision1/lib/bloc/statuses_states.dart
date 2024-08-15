import 'package:revisions1/models/status.dart';

class NewStatusState {}

class NewStatusEditingState extends NewStatusState {
  final List<Status> statuses;
  final String input;

  NewStatusEditingState(this.statuses, this.input);
}

class NewStatusSavingState extends NewStatusState {}

class NewStatusSavedState extends NewStatusState {
  final Status status;

  NewStatusSavedState(this.status);
}

class NewStatusErrorState extends NewStatusState {
  final Object error;
  final StackTrace trace;

  NewStatusErrorState(this.error, this.trace);
}