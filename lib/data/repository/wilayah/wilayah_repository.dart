part of '../repositories.dart';

abstract class WilayahRepository {
  Future<ApiReturnValue<List<Wilayah>>> getProvinsi({String provinsi});
  Future<ApiReturnValue<List<Wilayah>>> getKabupaten({String provinsi, String kabupaten});
  Future<ApiReturnValue<List<Wilayah>>> getKecamatan({String provinsi, String kabupaten, String kecamatan});
  Future<ApiReturnValue<List<Wilayah>>> getDesa({String provinsi, String kabupaten, String kecamatan, String desa});
}
