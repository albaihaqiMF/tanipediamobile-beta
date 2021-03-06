part of '../remote_services_impl.dart';

class PupukServicesImpl implements PupukServices {
  static const String tag = 'PUPUK_SERVICE';
  final http.Client client;
  PupukServicesImpl({@required this.client});

  //--------------------------------------------------------------------
  //                          GET List Pupuk
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<List<Pupuk>>> getlistPupuk({String token}) async {
    try {
      final apiResponse = await client.get(ApiUrl.baseURL + ApiUrl.jadwalPupuk,
          headers: apiHeaders(apiToken: token));

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listPupuk = (baseResponse.data)
          .map((data) => Pupuk.fromJSON(data))
          .toList()
          .cast<Pupuk>();

      return ApiReturnValue(value: listPupuk);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET List Pupuk Filter
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<List<Pupuk>>> getlistPupukFilter({String token, Map<String, String> queryFilter}) async {
    try {
      var uri = Uri.https(ApiUrl.baseHttpsURI, '/${ApiUrl.jadwalPupuk}', queryFilter);
      final apiResponse = await client.get(uri, headers: apiHeaders(apiToken: token));
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listPupuk = (baseResponse.data)
          .map((data) => Pupuk.fromJSON(data))
          .toList()
          .cast<Pupuk>();

      return ApiReturnValue(value: listPupuk);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }  catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET Detail Pupuk
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Pupuk>> getDetailPupuk({String token, String idPupuk}) async {
    try {
      final apiResponse = await client.get(
          ApiUrl.baseURL + ApiUrl.jadwalPupuk + '/' + idPupuk,
          headers: apiHeaders(apiToken: token));

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPupuk = Pupuk.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPupuk);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }  catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
