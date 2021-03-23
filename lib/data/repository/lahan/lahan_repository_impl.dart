part of '../repositories_impl.dart';

class LahanRepositoryImpl implements LahanRepository {
  static const String tag = 'LAHAN_REPOSITORY';
  final LahanServices networkDataSource;
  final NetworkInfo networkInfo;

  LahanRepositoryImpl({
    @required this.networkDataSource,
    @required this.networkInfo,
  });

  @override
  Future<ApiReturnValue<Lahan>> createLahan(
      String token,
      String kategori,
      int luas,
      String usiaTanam,
      int idPetani,
      String instansi,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi,
      String latitude,
      String longitude) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.createLahan(
        token: token,
        idPetani: idPetani,
        instansi: instansi,
        luas: luas,
        usiaTanam: usiaTanam,
        latitude: latitude,
        longitude: longitude,
        kategori: kategori,
        provinsi: provinsi,
        kabupaten: kabupaten,
        kecamatan: kecamatan,
        desa: desa,
        alamat: alamat,
      );
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }


  @override
  Future<ApiReturnValue<Lahan>> updateLahan(
      String token,
      String idLahan,
      String kategori,
      int luas,
      String usiaTanam,
      int idPetani,
      String instansi,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi,
      String latitude,
      String longitude) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.updateLahan(
        token: token,
        idLahan: idLahan,
        idPetani: idPetani,
        instansi: instansi,
        luas: luas,
        usiaTanam: usiaTanam,
        latitude: latitude,
        longitude: longitude,
        kategori: kategori,
        provinsi: provinsi,
        kabupaten: kabupaten,
        kecamatan: kecamatan,
        desa: desa,
        alamat: alamat,
      );
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Lahan>> deleteLahan(
      String token, String idLahan) async {
    if (await networkInfo.isConnected) {
      final networkData =
          await networkDataSource.deleteLahan(token: token, idLahan: idLahan);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Lahan>> getDetailLahan(
      String token, String idLahan) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getDetailLahan(
          token: token, idLahan: idLahan);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Lahan>>> getlistLahan(String token) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getlistLahan(token: token);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Lahan>>> getlistLahanFilter(
      String token, Map<String, String> queryFilter) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getlistLahanFilter(
          token: token, queryFilter: queryFilter);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
