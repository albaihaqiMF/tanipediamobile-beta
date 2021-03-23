part of '../remote_services.dart';

abstract class PupukServices {
  Future<ApiReturnValue<List<Pupuk>>> getlistPupuk({String token});
  Future<ApiReturnValue<List<Pupuk>>> getlistPupukFilter({String token, Map<String, String> queryFilter});
  Future<ApiReturnValue<Pupuk>> getDetailPupuk({String token, String idPupuk});
}