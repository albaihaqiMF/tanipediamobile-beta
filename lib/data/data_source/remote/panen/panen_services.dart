part of '../remote_services.dart';

class PanenServices implements PanenServicesContract {
  static const String tag = 'PANEN_SERVICE';
  final http.Client client;
  PanenServices({@required this.client});

  //--------------------------------------------------------------------
  //                          READ List Panen
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<List<Panen>>> getlistPanen({String token}) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.panen + '?order_by=id&sort=DESC',
          headers: apiHeaders(apiToken: token));

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listPanen = (baseResponse.data)
          .map((data) => Panen.fromJSON(data))
          .toList()
          .cast<Panen>();
      return ApiReturnValue(value: listPanen);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          READ Panen Filter
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<List<Panen>>> getlistPanenFilter(
  {String token, Map<String, String> queryFilter}) async {
    try {
      var uri = Uri.https(ApiUrl.baseHttpsURI, '/${ApiUrl.panen}', queryFilter);
      final apiResponse =
          await http.get(uri, headers: apiHeaders(apiToken: token));
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final listPanen = (baseResponse.data)
          .map((data) => Panen.fromJSON(data))
          .toList()
          .cast<Panen>();
      return ApiReturnValue(value: listPanen);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          GET Detail Panen
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Panen>> getDetailPanen(
  {String token, String idPanen}) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.panen + '/$idPanen',
          headers: apiHeaders(apiToken: token));

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          DELETE Panen
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Panen>> deletePanen(
  {String token, String idPanen}) async {
    try {
      final apiResponse = await http.delete(
          ApiUrl.baseURL + ApiUrl.panen + '/$idPanen',
          headers: apiHeaders(apiToken: token));

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          CReATE/POST Panen
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Panen>> createPanen({String token,
    int idPetani,
    String kategori,
    int totalPanen,
    // String satuan,
    // int usiaTanam,
    String tglTanam,
    String tglPanen,
    String keterangan,
    // int instansi,
    // String varietas,
    // int idLahan,
  }) async {
    Map<String, dynamic> fieldFormURL = {
      'id_petani': idPetani,
      'kategori': kategori,
      'total_panen': totalPanen,
      // 'satuan': satuan,
      // 'usia_tanam': usiaTanam,
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
          headers: apiHeaders(apiToken: token), body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          UPDATE Panen
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Panen>> updatePanen(
  {String token,
    int idPanen,
    int idPetani,
    String kategori,
    int totalPanen,
    // String satuan,
    // int usiaTanam,
    String tglTanam,
    String tglPanen,
    String keterangan,
    // String instansi,
    // String varietas,
    // int idLahan,
  }) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idPanen,
      'id_petani': idPetani,
      'kategori': kategori,
      'total_panen': totalPanen,
      // 'satuan': satuan,
      // 'usia_tanam': usiaTanam,
      'tgl_tanam': tglTanam,
      'tgl_panen': tglPanen,
      'keterangan': keterangan,
      // 'id_lahan': idLahan,
      // 'id_instansi': instansi,
      // 'varietas': varietas,
    };

    var body = jsonEncode(fieldFormURL);
    print('$tag, $fieldFormURL');
    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.panen,
          headers: apiHeaders(apiToken: token), body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataDetailPanen = Panen.fromJSON(baseResponse.data);

      return ApiReturnValue(value: dataDetailPanen);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
