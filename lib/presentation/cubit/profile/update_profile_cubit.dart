import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileRepository repository;
  UpdateProfileCubit({@required this.repository}) : assert(repository != null), super(UpdateProfileInitial());

  Future<void> updateProfile(
  {String apiToken,
      int idUser,
      int idProfile,
      String nama,
      String telp,
      String nik,
      String kk,
      String tglLahir,
      String kodepos,
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
    ApiReturnValue<Profile> result = await repository.updateDataProfile(
        token: apiToken,
        idProfile: idProfile,
        idUser: idUser,
        nama: nama,
        telp: telp,
        tglLahir: tglLahir,
        gender: gender,
        golDarah: golDarah,
        agama: agama,
        suku: suku,
        pendidikan: pendidikan,
        pekerjaan: pekerjaan,
        nik: nik,
        kk: kk,
        alamat: alamat,
        rt: rt,
        rw: rw,
        kodepos: kodepos,
        provinsi: provinsi,
        kabupaten: kabupaten,
        kecamatan: kecamatan,
        desa: desa);
    if (result.value != null) {
      emit(UpdateProfileLoaded(result.value));
    } else {
      emit(UpdateProfileFailed(result.message));
    }
  }
}
