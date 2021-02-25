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
      String telp,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa) async {
    ApiReturnValue<Profile> result = await ProfileServices.create(
        idUser,
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
      emit(CreateProfileLoaded(result.value));
    } else {
      emit(CreateProfileLoadingFailed(result.message));
    }
  }
}
