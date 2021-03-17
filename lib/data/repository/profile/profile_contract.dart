import 'package:tanipedia_mobile_app/data/model/models.dart';

abstract class ProfileRepositoryContract {
  Future<ApiReturnValue<Profile>> createDataProfile(
  {String token,
      int idUser,
      String nama,
      String telp,
      String tglLahir,
      String gender,
      String golDarah,
      String agama,
      String suku,
      String pendidikan,
      String pekerjaan,
      String nik,
      String kk,
      String alamat,
      String rt,
      String rw,
      String kodepos,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa}
      );
  Future<ApiReturnValue<Profile>> updateDataProfile(
  {String token,
      int idUser,
      int idProfile,
      String nama,
      String telp,
      String tglLahir,
      String gender,
      String golDarah,
      String agama,
      String suku,
      String pendidikan,
      String pekerjaan,
      String nik,
      String kk,
      String alamat,
      String rt,
      String rw,
      String kodepos,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa}
      );
  Future<ApiReturnValue<Profile>> getDataProfile({String token, int idProfile});
  Future<ApiReturnValue<Profile>> editPhotoProfile({String token, int idProfile, String photoProfile});
}
