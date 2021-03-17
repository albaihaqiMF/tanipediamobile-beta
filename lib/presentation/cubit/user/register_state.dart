part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final User user;
  RegisterLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class RegisterFailed extends RegisterState {
  final String message;
  RegisterFailed(this.message);
  @override
  List<Object> get props => [message];
}
