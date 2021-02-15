import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitial());

  Future<void> createProfile(int idUser, String nama, int nik, String tglLahir,
      int kodePos, String rt, String rw) async {
    ApiReturnValue<Profile> result = await ProfileServices.create(
        idUser, nama, nik, tglLahir, kodePos, rt, rw);
    if (result.value != null) {
      emit(CreateProfileLoaded(result.value));
    } else {
      emit(CreateProfileLoadingFailed(result.message));
    }
  }
}
