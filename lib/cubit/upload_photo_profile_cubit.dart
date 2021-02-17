import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'upload_photo_profile_state.dart';

class UploadPhotoProfileCubit extends Cubit<UploadPhotoProfileState> {
  UploadPhotoProfileCubit() : super(UploadPhotoProfileInitial());

  Future<void> uploadPhotoProfile(int idProfile, String photoProfile) async {
    ApiReturnValue<Profile> result =
        await ProfileServices.editPhotoProfile(idProfile, photoProfile);

    if (result.value != null) {
      emit(UploadPhotoProfileLoaded(result.value));
    } else {
      emit(UploadPhotoProfileFailed(result.message));
    }
  }
}
