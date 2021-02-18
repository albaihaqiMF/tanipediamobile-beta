part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;
  ProfileLoaded(this.profile);
  @override
  List<Object> get props => [profile];
}

class ProfileLoadingFailed extends ProfileState {
  final String message;
  ProfileLoadingFailed(this.message);
  @override
  List<Object> get props => [message];
}
