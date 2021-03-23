part of '../repositories_impl.dart';

class PanenRepositoryImpl implements PanenRepository {
  static const String tag = 'PANEN_REPOSITORY';
  final PanenServices networkDataSource;
  final NetworkInfo networkInfo;

  PanenRepositoryImpl({
    @required this.networkDataSource,
    @required this.networkInfo,
  });

  @override
  Future<ApiReturnValue<Panen>> createPanen(
      {String token,
      int idPetani,
      String kategori,
      int totalPanen,
      String tglTanam,
      String tglPanen,
      String keterangan}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.createPanen(
          token: token,
          idPetani: idPetani,
          kategori: kategori,
          keterangan: keterangan,
          tglPanen: tglPanen,
          tglTanam: tglTanam,
          totalPanen: totalPanen);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Panen>> deletePanen(
      {String token, String idPanen}) async {
    if (await networkInfo.isConnected) {
      final networkData =
          await networkDataSource.deletePanen(token: token, idPanen: idPanen);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Panen>> getDetailPanen(
      {String token, String idPanen}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getDetailPanen(
          token: token, idPanen: idPanen);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Panen>>> getlistPanen({String token}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getlistPanen(token: token);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Panen>>> getlistPanenFilter(
      {String token, Map<String, String> queryFilter}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getlistPanenFilter(
          token: token, queryFilter: queryFilter);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<Panen>> updatePanen(
      {String token,
      int idPanen,
      int idPetani,
      String kategori,
      int totalPanen,
      String tglTanam,
      String tglPanen,
      String keterangan}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.updatePanen(
          token: token,
          idPanen: idPanen,
          totalPanen: totalPanen,
          tglTanam: tglTanam,
          tglPanen: tglPanen,
          kategori: kategori,
          idPetani: idPanen,
          keterangan: keterangan);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
