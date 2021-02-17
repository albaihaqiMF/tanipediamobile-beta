part of 'upload_photo_profile_cubit.dart';

abstract class UploadPhotoProfileState extends Equatable {
  const UploadPhotoProfileState();

  @override
  List<Object> get props => [];
}

class UploadPhotoProfileInitial extends UploadPhotoProfileState {}

class UploadPhotoProfileLoaded extends UploadPhotoProfileState {
  final Profile profile;
  UploadPhotoProfileLoaded(this.profile);
  @override
  List<Object> get props => [profile];
}

class UploadPhotoProfileFailed extends UploadPhotoProfileState {
  final String message;
  UploadPhotoProfileFailed(this.message);
  @override
  List<Object> get props => [message];
}
