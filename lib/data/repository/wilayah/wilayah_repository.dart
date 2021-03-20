part of '../repositories.dart';

class WilayahRepository implements WilayahRepositoryContract {
  static const String tag = 'WILAYAH_REPOSITORY';
  final WilayahServicesContract networkDataSource;
  final NetworkInfo networkInfo;

  WilayahRepository({
    @required this.networkDataSource,
    @required this.networkInfo,
  });

  @override
  Future<ApiReturnValue<List<Wilayah>>> getDesa(
      {String provinsi,
      String kabupaten,
      String kecamatan,
      String desa}) async {
    if (await networkInfo.isConnected) {
      if (desa != null) {
        final networkData = await networkDataSource.getDesa(
            desa: desa,
            kecamatan: kecamatan,
            kabupaten: kabupaten,
            provinsi: provinsi);
        print('$tag, isConnected');
        return networkData;
      } else {
        final networkData = await networkDataSource.getDesa(
            kecamatan: kecamatan, kabupaten: kabupaten, provinsi: provinsi);
        print('$tag, isConnected');
        return networkData;
      }
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Wilayah>>> getKecamatan(
      {String provinsi, String kabupaten, String kecamatan}) async {
    if (await networkInfo.isConnected) {
      if (kecamatan != null) {
        final networkData = await networkDataSource.getKecamatan(
            kecamatan: kecamatan, kabupaten: kabupaten, provinsi: provinsi);
        print('$tag, isConnected');
        return networkData;
      } else {
        final networkData = await networkDataSource.getKecamatan(
            kabupaten: kabupaten, provinsi: provinsi);
        print('$tag, isConnected');
        return networkData;
      }
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Wilayah>>> getKabupaten(
      {String provinsi, String kabupaten}) async {
    if (await networkInfo.isConnected) {
      if (kabupaten != null) {
        final networkData = await networkDataSource.getKabupaten(
            kabupaten: kabupaten, provinsi: provinsi);
        print('$tag, isConnected');
        return networkData;
      } else {
        final networkData =
            await networkDataSource.getKabupaten(provinsi: provinsi);
        print('$tag, isConnected');
        return networkData;
      }
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Wilayah>>> getProvinsi({String provinsi}) async {
    if (await networkInfo.isConnected) {
      if (provinsi != null) {
        final networkData =
            await networkDataSource.getProvinsi(provinsi: provinsi);
        print('$tag, isConnected');
        print('$tag, provinsi : $provinsi');
        return networkData;
      } else {
        final networkData = await networkDataSource.getProvinsi();
        print('$tag, isConnected');
        print('$tag, provinsi : $provinsi');
        return networkData;
      }
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
