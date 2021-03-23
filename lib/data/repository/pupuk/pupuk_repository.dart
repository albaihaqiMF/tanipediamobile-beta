part of '../repositories.dart';

abstract class PupukRepository {
  Future<ApiReturnValue<List<Pupuk>>> getlistPupuk({String token});
  Future<ApiReturnValue<List<Pupuk>>> getlistPupukFilter({String token, Map<String, String> queryFilter});
  Future<ApiReturnValue<Pupuk>> getDetailPupuk({String token, String idPupuk});
}