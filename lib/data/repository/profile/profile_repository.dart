part of '../repositories.dart';

class ProfileRepository implements ProfileRepositoryContract {
  static const String tag = 'PROFILE_REPOSITORY';
  final ProfileServicesContract networkDataSource;
  final ProfileLocalServicesContract localDataSource;
  final NetworkInfo networkInfo;

  ProfileRepository({
    @required this.networkDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<ApiReturnValue<Profile>> getDataProfile(
  {String token, int idProfile}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.read(token:token, idProfile:idProfile);
      localDataSource.cacheNumberTrivia(networkData.value);
      print('$tag, isConnected');
      return networkData;
    } else {
      final localData = await localDataSource.getLastNumberTrivia();
      print('$tag, isDisconnected : $localData');
      print('$tag, Local Data : $localData');
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
      localDataSource.cacheNumberTrivia(networkData.value);
      print('$tag, isConnected');
      return networkData;
    } else {
      final localData = await localDataSource.getLastNumberTrivia();
      print('$tag, isDisconnected : $localData');
      print('$tag, Local Data : $localData');
      return localData;
    }
  }

  @override
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
  ) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.update(
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
      localDataSource.cacheNumberTrivia(networkData.value);
      print('$tag, isConnected');
      return networkData;
    } else {
      final localData = await localDataSource.getLastNumberTrivia();
      print('$tag, isDisconnected : $localData');
      print('$tag, Local Data : $localData');
      return localData;
    }
  }

  @override
  Future<ApiReturnValue<Profile>> editPhotoProfile(
  {String token, int idProfile, String photoProfile}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.editPhotoProfile(token:token, idProfile:idProfile, photoProfile:photoProfile);
      localDataSource.cacheNumberTrivia(networkData.value);
      print('$tag, isConnected');
      return networkData;
    } else {
      final localData = await localDataSource.getLastNumberTrivia();
      print('$tag, isDisconnected : $localData');
      print('$tag, Local Data : $localData');
      return localData;
    }
  }
}
