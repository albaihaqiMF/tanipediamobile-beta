part of 'services.dart';

class WilayahServices {
  static const String tag = 'WILAYAH_SERVICE';

  //--------------------------------------------------------------------
  //                          GET List Provinsi
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getProvinsi(
      {String provinsi}) async {
    try {
      var apiResponse;
      if (provinsi != null) {
        Map<String, String> queryParam = {
          'provinsi': provinsi,
        };
        print('$tag Provinsi : $queryParam');
        var uri = Uri.https(ApiUrl.baseURI, ApiUrl.provinsi, queryParam);
        apiResponse = await http.get(uri, headers: apiHeaders());
      } else {
        apiResponse = await http.get(ApiUrl.baseURL + ApiUrl.provinsi,
            headers: apiHeaders());
      }

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listProvinsi = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();
      return ApiReturnValue(value: listProvinsi);
    } catch (e) {
      print('$tag Provinsi, Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET List Kabupaten
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getKabupaten(String provinsi,
      {String kabupaten}) async {
    Map<String, String> queryParam;
    try {
      if (kabupaten != null) {
        queryParam = {
          'provinsi': provinsi,
          'kabupatenkota': kabupaten,
        };
      } else {
        queryParam = {
          'provinsi': provinsi,
          'order_by': 'id',
          'sort': 'ASC',
        };
      }
      print('$tag Kabupaten : $queryParam');
      final uri = Uri.https(ApiUrl.baseURI, '/${ApiUrl.kabupaten}', queryParam);
      final apiResponse = await http.get(uri, headers: apiHeaders());
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listProvinsi = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();
      return ApiReturnValue(value: listProvinsi);
    } catch (e) {
      print('$tag Kabupaten, Exception ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET List Kecamatan
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getKecamatan(
      String provinsi, String kabupaten,
      {String kecamatan}) async {
    try {
      Map<String, String> queryParam;
      if (kecamatan != null) {
        queryParam = {
          'provinsi': provinsi,
          'kabupatenkota': kabupaten,
          'kecamatan': kecamatan
        };
      } else {
        queryParam = {
          'provinsi': provinsi,
          'kabupatenkota': kabupaten,
          'order_by': 'id',
          'sort': 'ASC',
        };
      }
      print('$tag Kecamatan : $queryParam');
      final uri = Uri.https(ApiUrl.baseURI, '/${ApiUrl.kecamatan}', queryParam);
      final apiResponse = await http.get(uri, headers: apiHeaders());
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listWilayah = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();
      return ApiReturnValue(value: listWilayah);
    } catch (e) {
      print('$tag Kecamatan, Exception ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET List Desa
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getDesa(
      String provinsi, String kabupaten, String kecamatan,
      {String desa}) async {
    try {
      Map<String, String> queryParam;
      if (desa != null) {
        queryParam = {
          'provinsi': provinsi,
          'kabupatenkota': kabupaten,
          'kecamatan': kecamatan,
          'kelurahan': desa
        };
      } else {
        queryParam = {
          'provinsi': provinsi,
          'kabupatenkota': kabupaten,
          'kecamatan': kecamatan,
          'order_by': 'id',
          'sort': 'ASC',
        };
      }
      print('$tag Desa : $queryParam');
      var uri = Uri.https(ApiUrl.baseURI, '/${ApiUrl.desa}', queryParam);
      final apiResponse = await http.get(uri, headers: apiHeaders());
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listWilayah = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();
      return ApiReturnValue(value: listWilayah);
    } catch (e) {
      print('$tag Desa, Exception ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
