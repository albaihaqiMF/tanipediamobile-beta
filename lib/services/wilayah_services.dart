part of 'services.dart';

class WilayahServices {
  static const String tag = 'WILAYAH_SERVICE';
  //--------------------------------------------------------------------
  //                          GET List Provinsi
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getProvinsi() async {
    try {
      // HTTP Method
      final apiResponse = await http.get(ApiUrl.baseURL + ApiUrl.provinsi,
          headers: ApiUrl.headersAuth);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listProvinsi = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();
      return ApiReturnValue(value: listProvinsi);

      // dio.Response response;
      // dio.Dio dioServices = new dio.Dio();
      // response = await dioServices.get(ApiUrl.baseURL + ApiUrl.provinsi,
      //     options: dio.Options(headers: ApiUrl.headersAuth));
      // print('$tag Kabupaten, ${response.data.toString()}');
      // print('$tag Kabupaten, ${response.statusCode.toString()}');
      // final baseResponse = Response.fromJSON(response.data);
      // final listProvinsi = (baseResponse.data)
      //     .map((data) => Wilayah.fromJSON(data))
      //     .toList()
      //     .cast<Wilayah>();
      // return ApiReturnValue(value: listProvinsi);
    } catch (e) {
      print('$tag Provinsi, Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET List Kabupaten
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getKabupaten(
      String provinsi) async {
    // DIO Method
    try {
      //   var rawData = {
      //   'filter': {'provinsi': provinsi},
      //   'order': {'order_by': 'id', 'sort': 'ASC', 'page': 1, 'limit_page': 100}
      // };
      //   dio.Response response;
      //   dio.Dio dioServices = new dio.Dio();
      //   response = await dioServices.get(ApiUrl.baseURL + ApiUrl.kabupaten,
      //       queryParameters: rawData,
      //       options: dio.Options(headers: ApiUrl.headersAuth));
      //   print('$tag Kabupaten, ${response.data.toString()}');
      //   print('$tag Kabupaten, ${response.statusCode.toString()}');
      //   final baseResponse = Response.fromJSON(response.data);
      //   final listKabupaten = (baseResponse.data)
      //       .map((data) => Wilayah.fromJSON(data))
      //       .toList()
      //       .cast<Wilayah>();
      //   return ApiReturnValue(value: listKabupaten);

      Map<String, String> rawFilter = {
        'provinsi': provinsi,
      };

      Map<String, dynamic> rawOrder = {
        'order_by': 'id',
        'sort': 'ASC',
        'page': 1,
        'limit_page': 100
      };
      Map<String, dynamic> rawData = {'filter': rawFilter, 'order': rawOrder};
      // var uri = Uri.https(ApiUrl.baseURL, ApiUrl.provinsi, rawData);
      // final apiResponse = await http.get(uri, headers: ApiUrl.headersAuth);

      var body = {
        'filter': {'provinsi': provinsi},
        'order': {'order_by': 'id', 'sort': 'ASC', 'page': 1, 'limit_page': 100}
      };

      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.provinsi,
          headers: ApiUrl.headersAuth, body: jsonEncode(rawData));
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
      String provinsi, String kabupaten) async {
    var rawData = {
      'filter': {'provinsi': provinsi, 'kabupatenkota': kabupaten},
      'order': {'order_by': 'id', 'sort': 'ASC', 'page': 1, 'limit_page': 100}
    };
    // DIO Method
    try {
      dio.Response response;
      dio.Dio dioServices = new dio.Dio();
      response = await dioServices.get(ApiUrl.baseURL + ApiUrl.kecamatan,
          queryParameters: rawData,
          options: dio.Options(headers: ApiUrl.headersAuth));
      print('$tag Kecamatan, ${response.data.toString()}');
      print('$tag Kecamatan, ${response.statusCode.toString()}');
      final baseResponse = Response.fromJSON(response.data);
      final listKecamatan = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();

      return ApiReturnValue(value: listKecamatan);
    } catch (e) {
      print('$tag Kabupaten, Exception ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET List Desa
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<List<Wilayah>>> getDesa(
      String provinsi, String kabupaten, String kecamatan) async {
    var rawData = {
      'filter': {
        'provinsi': provinsi,
        'kabupatenkota': kabupaten,
        'kecamatan': kecamatan
      },
      'order': {'order_by': 'id', 'sort': 'ASC', 'page': 1, 'limit_page': 100}
    };
    // DIO Method
    try {
      dio.Response response;
      dio.Dio dioServices = new dio.Dio();
      response = await dioServices.get(ApiUrl.baseURL + ApiUrl.desa,
          queryParameters: rawData,
          options: dio.Options(headers: ApiUrl.headersAuth));
      print('$tag Desa, ${response.data.toString()}');
      print('$tag Desa, ${response.statusCode.toString()}');
      final baseResponse = Response.fromJSON(response.data);
      final listDesa = (baseResponse.data)
          .map((data) => Wilayah.fromJSON(data))
          .toList()
          .cast<Wilayah>();

      return ApiReturnValue(value: listDesa);
    } catch (e) {
      print('$tag Kabupaten, Exception ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
