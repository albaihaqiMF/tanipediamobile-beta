import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';

part 'upload_photo_profile_state.dart';

class UploadPhotoProfileCubit extends Cubit<UploadPhotoProfileState> {
  final ProfileRepositoryContract repository;
  UploadPhotoProfileCubit({@required this.repository}): assert(repository != null),super(UploadPhotoProfileInitial());

  Future<void> uploadPhotoProfile({String token, int idProfile, String photoProfile}) async {
    ApiReturnValue<Profile> result =
        await repository.editPhotoProfile(token:token, idProfile:idProfile, photoProfile:photoProfile);

    if (result.value != null) {
      emit(UploadPhotoProfileLoaded(result.value));
    } else {
      emit(UploadPhotoProfileFailed(result.message));
    }
  }
}
