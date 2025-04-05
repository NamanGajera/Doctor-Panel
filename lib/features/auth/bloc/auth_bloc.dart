import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<ToggleLoginAndSignUpPageEvent>(_togglePage);
  }

  void _togglePage(ToggleLoginAndSignUpPageEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoginPage: event.isLoginPage));
  }
}
