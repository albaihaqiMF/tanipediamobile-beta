part of 'services.dart';

class LahanServices {
  static const String tag = 'LAHAN_SERVICE';

  //--------------------------------------------------------------------
  //                          GET List Lahan
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Lahan>>> getlistLahan() async {
    try {
      final apiResponse = await http.get(ApiUrl.baseURL + ApiUrl.lahan,
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listLahan = (baseResponse.data)
          .map((data) => Lahan.fromJSON(data))
          .toList()
          .cast<Lahan>();

      return ApiReturnValue(value: listLahan);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET Detail Lahan
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Lahan>> getDetailLahan(String idLahan) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.lahan + '/$idLahan',
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailLahan = Lahan.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailLahan);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          CREATE/POST Lahan
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Lahan>> createLahan(
      String kategori,
      int luas,
      int satuan,
      String usiaTanam,
      String idPetani,
      String instansi,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi,
      String latitude,
      String longitude) async {
    Map<String, dynamic> fieldFormURL = {
      'kategori': kategori,
      'luas': luas,
      'satuan': satuan,
      'alamat': alamat,
      'usia_tanam': usiaTanam,
      'id_petani': idPetani,
      'id_instansi': instansi,
      'id_desa': desa,
      'id_kecamatan': kecamatan,
      'id_kabupaten': kabupaten,
      'id_provinsi': provinsi,
      'latitude': latitude,
      'longitude': longitude,
    };

    var body = jsonEncode(fieldFormURL);
    print('$tag, $body');

    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.lahan,
          headers: ApiUrl.headersAuth, body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseDataLahan = Lahan.fromJSON(baseResponse.data);
      return ApiReturnValue(value: responseDataLahan);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          DELETE Lahan
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Lahan>> deleteLahan(String idLahan) async {
    try {
      final apiResponse = await http.delete(
          ApiUrl.baseURL + ApiUrl.lahan + '/$idLahan',
          headers: ApiUrl.headersAuth);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseDataLahan = Lahan.fromJSON(baseResponse.data);
      return ApiReturnValue(value: responseDataLahan);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          UPDATE Lahan
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Lahan>> updateLahan(
      String idLahan,
      String kategori,
      int luas,
      int satuan,
      String usiaTanam,
      String idPetani,
      String instansi,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi,
      String latitude,
      String longitude) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idLahan,
      'kategori': kategori,
      'luas': luas,
      'satuan': satuan,
      'alamat': alamat,
      'usia_tanam': usiaTanam,
      'id_petani': idPetani,
      'id_instansi': instansi,
      'id_desa': desa,
      'id_kecamatan': kecamatan,
      'id_kabupaten': kabupaten,
      'id_provinsi': provinsi,
      'latitude': latitude,
      'longitude': longitude,
    };

    var body = jsonEncode(fieldFormURL);

    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.lahan,
          headers: ApiUrl.headersAuth, body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseDataLahan = Lahan.fromJSON(baseResponse.data);
      return ApiReturnValue(value: responseDataLahan);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
