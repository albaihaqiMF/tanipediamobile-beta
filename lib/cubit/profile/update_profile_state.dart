part of 'update_profile_cubit.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoaded extends UpdateProfileState {
  final Profile profile;
  UpdateProfileLoaded(this.profile);
  @override
  List<Object> get props => [profile];
}

class UpdateProfileFailed extends UpdateProfileState {
  final String message;
  UpdateProfileFailed(this.message);
  @override
  List<Object> get props => [message];
}
