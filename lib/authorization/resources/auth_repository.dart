import 'package:amina_ex/authorization/bloc/auth_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

class AuthRepository {
  Future<void> onGetAuthEvent(
      GetAuthEvent event, Emitter<AuthBlocState> emit) async {
    Response response;
    emit(LoadingAuthState());
    try {
      response = await http.post(
        Uri.parse("http://10.0.2.2:3000/aminka"),
        body: convert.jsonEncode({
          'username': event.username,
        }),
      );
      emit(LoadedAuthState());
    } catch (_) {
      emit(FailureLoginState());
    }
  }
}

class AuthRepository2 {
  Future<void> onGetAuthEvent2(
      GetAuthEvent2 event, Emitter<AuthBlocState> emit) async {
    Response response;
    emit(LoadingAuthState());
    try {
      response = await http.post(
        Uri.parse("http://10.0.2.2:3000/aminka"),
        body: convert.jsonEncode({
          'username': event.password,
        }),
      );
      emit(LoadedAuthState());
    } catch (_) {
      emit(FailureLoginState());
    }
  }
}
