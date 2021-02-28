part of 'services.dart';

class PanenServices {
  static const String tag = 'LAHAN_SERVICE';

  //--------------------------------------------------------------------
  //                          READ List Panen
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Panen>>> getlistPanen() async {
    try {
      final apiResponse = await http.get(ApiUrl.baseURL + ApiUrl.panen,
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listPanen = (baseResponse.data)
          .map((data) => Panen.fromJSON(data))
          .toList()
          .cast<Panen>();
      return ApiReturnValue(value: listPanen);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET Detail Panen
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Panen>> getDetailPanen(String idPanen) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.panen + '/$idPanen',
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          DELETE Panen
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Panen>> deletePanen(String idPanen) async {
    try {
      final apiResponse = await http.delete(
          ApiUrl.baseURL + ApiUrl.panen + '/$idPanen',
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          CReATE/POST Panen
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Panen>> createPanen(
    String idPetani,
    String kategori,
    int totalPanen,
    int satuan,
    String usiaTanam,
    String tglTanam,
    String tglPanen,
    String keterangan,
    // String instansi,
    // String varietas,
    // String idLahan,
  ) async {
    Map<String, dynamic> fieldFormURL = {
      'id_petani': idPetani,
      'kategori': kategori,
      'total_panen': totalPanen,
      'satuan': satuan,
      'usia_tanam': usiaTanam,
      'tgl_tanam': tglTanam,
      'tgl_panen': tglPanen,
      'keterangan': keterangan,
      // 'id_lahan': idLahan,
      // 'id_instansi': instansi,
      // 'varietas': varietas,
    };

    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.panen,
          headers: ApiUrl.headersAuth, body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          UPDATE Panen
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Panen>> updatePanen(
    String idPanen,
    String idPetani,
    String kategori,
    int totalPanen,
    int satuan,
    String usiaTanam,
    String tglTanam,
    String tglPanen,
    String keterangan,
    // String instansi,
    // String varietas,
    // String idLahan,
  ) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idPanen,
      'id_petani': idPetani,
      'kategori': kategori,
      'total_panen': totalPanen,
      'satuan': satuan,
      'usia_tanam': usiaTanam,
      'tgl_tanam': tglTanam,
      'tgl_panen': tglPanen,
      'keterangan': keterangan,
      // 'id_lahan': idLahan,
      // 'id_instansi': instansi,
      // 'varietas': varietas,
    };

    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.panen,
          headers: ApiUrl.headersAuth, body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
