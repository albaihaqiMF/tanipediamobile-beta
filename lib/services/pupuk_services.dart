part of 'services.dart';

class PupukServices {
  static const String tag = 'PUPUK_SERVICE';

  static Future<ApiReturnValue<List<Pupuk>>> getlistPupuk() async {
    try {
      final apiResponse = await http.get(ApiUrl.baseURL + ApiUrl.jadwalPupuk,
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listPupuk = (baseResponse.data)
          .map((data) => Pupuk.fromJSON(data))
          .toList()
          .cast<Pupuk>();

      return ApiReturnValue(value: listPupuk);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  static Future<ApiReturnValue<Pupuk>> getDetailPupuk(String idPupuk) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.jadwalPupuk + '/' + idPupuk,
          headers: ApiUrl.headersAuth);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPupuk = Pupuk.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPupuk);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
