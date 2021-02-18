part of 'services.dart';

class LahanServices {
  static const String tag = 'LAHAN_SERVICE';

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

  static Future<ApiReturnValue<Lahan>> getDetailLahan(String idLahan) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.lahan + '/' + idLahan,
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
}
