part of '../remote_services.dart';

abstract class LahanServices {
  Future<ApiReturnValue<List<Lahan>>> getlistLahan({String token});
  Future<ApiReturnValue<List<Lahan>>> getlistLahanFilter({String token, Map<String, String> queryFilter});
  Future<ApiReturnValue<Lahan>> getDetailLahan({String token, String idLahan});
  Future<ApiReturnValue<Lahan>> deleteLahan({String token, String idLahan});
  Future<ApiReturnValue<Lahan>> createLahan(
      {String token,
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
        String longitude,
      });
  Future<ApiReturnValue<Lahan>> updateLahan(
      {String token,
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
        String longitude,
      });
}