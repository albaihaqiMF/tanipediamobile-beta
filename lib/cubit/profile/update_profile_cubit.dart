import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateProfile(
  {String apiToken,
      int idUser,
      int idProfile,
      String nama,
      String telp,
      String nik,
      String kk,
      String tglLahir,
      String kodePos,
      String alamat,
      String rt,
      String rw,
      String gender,
      String golDarah,
      String suku,
      String agama,
      String pendidikan,
      String pekerjaan,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa}) async {
    ApiReturnValue<Profile> result = await ProfileServices.update(
        apiToken,
        idUser,
        idProfile,
        nama,
        telp,
        tglLahir,
        gender,
        golDarah,
        agama,
        suku,
        pendidikan,
        pekerjaan,
        nik,
        kk,
        alamat,
        rt,
        rw,
        kodePos,
        provinsi,
        kabupaten,
        kecamatan,
        desa);
    if (result.value != null) {
      emit(UpdateProfileLoaded(result.value));
    } else {
      emit(UpdateProfileFailed(result.message));
    }
  }
}
