part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final bool isLoginPage;

  const AuthState({
    this.isLoginPage = true,
  });

  @override
  List<Object?> get props => [isLoginPage];

  AuthState copyWith({
    bool? isLoginPage,
  }) {
    return AuthState(
      isLoginPage: isLoginPage ?? this.isLoginPage,
    );
  }
}

class AuthInitialState extends AuthState {}
