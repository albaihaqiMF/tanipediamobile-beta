part of 'create_profile_cubit.dart';

abstract class CreateProfileState extends Equatable {
  const CreateProfileState();

  @override
  List<Object> get props => [];
}

class CreateProfileInitial extends CreateProfileState {}

class CreateProfileLoaded extends CreateProfileState {
  final Profile profile;
  CreateProfileLoaded(this.profile);
  @override
  List<Object> get props => [profile];
}

class CreateProfileLoadingFailed extends CreateProfileState {
  final String message;
  CreateProfileLoadingFailed(this.message);
  @override
  List<Object> get props => [message];
}
