part of '../remote_services.dart';

abstract class UserServices {
  Future<ApiReturnValue<User>> register({String username, String password});
  Future<ApiReturnValue<User>> verifyUser({String token});
  Future<ApiReturnValue<User>> login({String username, String password});
  Future<ApiReturnValue<User>> update({String token, int idUser, String noTelp, int idProfile});
}