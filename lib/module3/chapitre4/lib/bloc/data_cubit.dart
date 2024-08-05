import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module3_chapitre4/models/conversations.dart';

class DataCubit extends Cubit<Data> {
  DataCubit() : super(Data(null, []));

  void changeText(String value) {
    final oldData = super.state;
    final newData = Data(value, oldData.names);
    emit(newData);
  }

  void addConversation() {
    final oldData = super.state;

    if (oldData.input != null) {
      final newData = Data(null, [...oldData.names, oldData.input!]);
      emit(newData);
    }
  }

  void deleteConversation(String name) {
    final oldData = super.state;
    final newData = Data(oldData.input, [...oldData.names]);
    newData.names.remove(name);
    emit(newData);
  }
}