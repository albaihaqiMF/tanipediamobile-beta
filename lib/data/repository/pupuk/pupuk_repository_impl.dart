part of '../repositories_impl.dart';

class PupukRepositoryImpl implements PupukRepository {
  static const String tag = 'PUPUK_REPOSITORY';
  final PupukServices networkDataSource;
  final NetworkInfo networkInfo;

  PupukRepositoryImpl({
    @required this.networkDataSource,
    @required this.networkInfo,
  });

  @override
  Future<ApiReturnValue<Pupuk>> getDetailPupuk({String token, String idPupuk}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getDetailPupuk(token:token, idPupuk:idPupuk);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Pupuk>>> getlistPupuk({String token}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getlistPupuk(token: token);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<List<Pupuk>>> getlistPupukFilter({String token, Map<String, String> queryFilter}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.getlistPupukFilter(token:token, queryFilter:queryFilter);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

}