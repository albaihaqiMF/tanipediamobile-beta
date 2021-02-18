import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitial());

  Future<void> createProfile(
      int idUser,
      String nama,
      int nik,
      int kk,
      String tglLahir,
      int kodePos,
      String rt,
      String rw,
      String gender,
      String golDarah,
      String suku,
      String agama,
      String pendidikan,
      String pekerjaan,
      String kategori,
      String telp) async {
    ApiReturnValue<Profile> result = await ProfileServices.create(
        idUser,
        nama,
        nik,
        kk,
        tglLahir,
        kodePos,
        rt,
        rw,
        gender,
        golDarah,
        suku,
        agama,
        pendidikan,
        pekerjaan,
        kategori,
        telp);
    if (result.value != null) {
      emit(CreateProfileLoaded(result.value));
    } else {
      emit(CreateProfileLoadingFailed(result.message));
    }
  }
}
