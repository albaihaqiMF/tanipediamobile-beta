part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  final User user;
  LoginLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed(this.message);
  @override
  List<Object> get props => [message];
}
