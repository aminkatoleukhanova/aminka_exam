part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocEvent {}

class GetAuthEvent extends AuthBlocEvent {
  final String username;
  GetAuthEvent(this.username);
}

class GetAuthEvent2 extends AuthBlocEvent {
  final String password;
  GetAuthEvent2(this.password);
}
