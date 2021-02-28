part of 'verify_user_cubit.dart';

abstract class VerifyUserState extends Equatable {
  const VerifyUserState();

  @override
  List<Object> get props => [];
}

class VerifyUserInitial extends VerifyUserState {}

class VerifyUserLoaded extends VerifyUserState {
  final User user;
  VerifyUserLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class VerifyUserFailed extends VerifyUserState {
  final String message;
  VerifyUserFailed(this.message);
  @override
  List<Object> get props => [message];
}
