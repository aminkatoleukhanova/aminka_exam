import 'package:amina_ex/authorization/resources/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final _repository = AuthRepository();
  final _repository2 = AuthRepository2();
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) => emit(AuthBlocInitial()));
    on<GetAuthEvent>(_repository.onGetAuthEvent);
    on<GetAuthEvent2>(_repository2.onGetAuthEvent2);
  }
}
