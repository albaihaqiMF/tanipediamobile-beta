part of '../repositories.dart';

abstract class PanenRepository {
  Future<ApiReturnValue<List<Panen>>> getlistPanen({String token});
  Future<ApiReturnValue<List<Panen>>> getlistPanenFilter({String token, Map<String, String> queryFilter});
  Future<ApiReturnValue<Panen>> getDetailPanen({String token, String idPanen});
  Future<ApiReturnValue<Panen>> updatePanen({
    String token,
    int idPanen,
    int idPetani,
    String kategori,
    int totalPanen,
    String tglTanam,
    String tglPanen,
    String keterangan,
  });
  Future<ApiReturnValue<Panen>> createPanen({
    String token,
    int idPetani,
    String kategori,
    int totalPanen,
    String tglTanam,
    String tglPanen,
    String keterangan,
  });

  Future<ApiReturnValue<Panen>> deletePanen({String token, String idPanen});
}
