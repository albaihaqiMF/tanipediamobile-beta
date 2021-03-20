part of '../repositories.dart';

class UserRepository implements UserRepositoryContract {
  static const String tag = 'USER_REPOSITORY';
  final UserServicesContract networkDataSource;
  final NetworkInfo networkInfo;

  UserRepository({
    @required this.networkDataSource,
    @required this.networkInfo,
  });


  @override
  Future<ApiReturnValue<User>> login({String username, String password}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.login(username: username, password: password);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<User>> register({String username, String password}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.register(username: username, password: password);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<User>> update({String token, int idUser, String noTelp, int idProfile}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.update(token: token, idProfile: idProfile, idUser: idUser, noTelp: noTelp);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  @override
  Future<ApiReturnValue<User>> verifyUser({String token}) async {
    if (await networkInfo.isConnected) {
      final networkData = await networkDataSource.verifyUser(token: token);
      print('$tag, isConnected');
      return networkData;
    } else {
      // Handle Disconnect
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

}
