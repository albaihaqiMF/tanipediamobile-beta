part of '../repositories_impl.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  static const String tag = 'PROFILE_REPOSITORY';
  final ProfileServices networkDataSource;
  final ProfileLocalServices localDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({
    @required this.networkDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<ApiReturnValue<Profile>> getDataProfile(
  {String token, int idProfile}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.read(token:token, idProfile:idProfile);
      localDataSource.cacheDataProfile(networkData.value);
      localDataSource.cacheSQLite(networkData.value);
      print('$tag, Cache Data : ${networkData.value}');
      print('$tag, isConnected');
      return networkData;
    } else {
      final localData = await localDataSource.getDataProfile();
      final localDataSQlite = await localDataSource.getFromSQLite();
      print('$tag, isDisconnected');
      print('$tag, Local Data : data Prefs = ${localData.value.nama}');
      print('$tag, Local Data : data SQLite = ${localDataSQlite.value.nama}');
      return localData;
    }
  }

  @override
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
      String desa}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.create(
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
          kodePos: kodepos,
          provinsi: provinsi,
          kabupaten: kabupaten,
          kecamatan: kecamatan,
          desa: desa);
      // localDataSource.cacheDataProfile(networkData.value);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      // final finallocalData = await localDataSource.getDataProfile();
      print('$tag, isDisconnected : LocalData');
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Profile>> updateDataProfile(
  {String token,
    int idProfile,
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
  ) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.update(
          token: token,
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
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Profile>> editPhotoProfile(
  {String token, int idProfile, String photoProfile}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.editPhotoProfile(token:token, idProfile:idProfile, photoProfile:photoProfile);
      // localDataSource.cacheDataProfile(networkData.value);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
