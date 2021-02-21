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
  //                          READ Detail Panen
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
      String kategori,
      String instansi,
      String varietas,
      int totalPanen,
      int satuan,
      String tglTanam,
      String tglPanen,
      String idLahan,
      String keterangan) async {
    Map<String, dynamic> fieldFormURL = {
      'id_petani': kategori,
      'id_instansi': instansi,
      'kategori': kategori,
      'varietas': varietas,
      'total_panen': totalPanen,
      'satuan': satuan,
      'tgl_tanam': tglTanam,
      'tgl_panen': tglPanen,
      'id_lahan': idLahan,
      'keterangan': keterangan,
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
      String kategori,
      String instansi,
      String varietas,
      int totalPanen,
      int satuan,
      String tglTanam,
      String tglPanen,
      String idLahan,
      String keterangan) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idPanen,
      'id_petani': kategori,
      'id_instansi': instansi,
      'kategori': kategori,
      'varietas': varietas,
      'total_panen': totalPanen,
      'satuan': satuan,
      'tgl_tanam': tglTanam,
      'tgl_panen': tglPanen,
      'id_lahan': idLahan,
      'keterangan': keterangan,
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
