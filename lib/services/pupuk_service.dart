part of 'services.dart';

class PupukServices {
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
      print('PUPUK_SERVICE Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
