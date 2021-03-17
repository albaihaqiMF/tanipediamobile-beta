import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/repository/profile/profile_contract.dart';
import 'package:meta/meta.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  final ProfileRepositoryContract repository;
  CreateProfileCubit({@required this.repository})
      : assert(repository != null),
        super(CreateProfileInitial());

  Future<void> createProfile(
      {String token,
      int idUser,
      String nama,
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
      String telp,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa}) async {
    ApiReturnValue<Profile> result = await repository.createDataProfile(
        token: token,
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
      emit(CreateProfileLoaded(result.value));
    } else {
      emit(CreateProfileLoadingFailed(result.message));
    }
  }
}
