part of 'get_profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class GetProfileInitial extends ProfileState {}

class GetProfileLoaded extends ProfileState {
  final Profile profile;
  GetProfileLoaded(this.profile);
  @override
  List<Object> get props => [profile];
}

class GetProfileFailed extends ProfileState {
  final String message;
  GetProfileFailed(this.message);
  @override
  List<Object> get props => [message];
}
