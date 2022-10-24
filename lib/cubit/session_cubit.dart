import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<String> {
  SessionCubit() : super("");

  void setSession(String session) {
    emit(session);
  }

  String getSession() {
    return state;
  }

  void clearSession() {
    emit("");
  }

  bool hasSession() {
    return state.isNotEmpty;
  }
}
