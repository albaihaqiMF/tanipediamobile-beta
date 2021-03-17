part of 'remote_services.dart';

abstract class ProfileServicesContract {
  Future<ApiReturnValue<Profile>> create(
      {String token,
      int idUser,
      String nama,
      String telp,
      String tglLahir,
      String gender,
      String golDarah,
      String agama,
      String suku,
      String pendidikan,
      String pekerjaan,
      String nik,
      String kk,
      String alamat,
      String rt,
      String rw,
      String kodePos,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa});
  Future<ApiReturnValue<Profile>> update(
      {String token,
      int idUser,
      int idProfile,
      String nama,
      String telp,
      String tglLahir,
      String gender,
      String golDarah,
      String agama,
      String suku,
      String pendidikan,
      String pekerjaan,
      String nik,
      String kk,
      String alamat,
      String rt,
      String rw,
      String kodepos,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String desa});
  Future<ApiReturnValue<Profile>> read({String token, int idProfile});
  Future<ApiReturnValue<Profile>> editPhotoProfile(
  {String token, int idProfile, String photoProfile});
}

class ProfileServices implements ProfileServicesContract {
  static const String tag = 'PROFILE_SERVICE';
  final http.Client client;
  ProfileServices({@required this.client});

  //--------------------------------------------------------------------
  //                          CREATE Profile
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Profile>> create(
  {String token,
    int idUser,
    String nama,
    String telp,
    String tglLahir,
    String gender,
    String golDarah,
    String agama,
    String suku,
    String pendidikan,
    String pekerjaan,
    String nik,
    String kk,
    String alamat,
    String rt,
    String rw,
    String kodePos,
    String provinsi,
    String kabupaten,
    String kecamatan,
    String desa}
  ) async {
    Map<String, dynamic> fieldFormURL = {
      'id_user': idUser,
      'nama': nama,
      'telp': telp,
      'tgl_lahir': tglLahir,
      'gender': gender,
      'gol_darah': golDarah,
      'agama': agama,
      'suku': suku,
      'pendidikan': pendidikan,
      'pekerjaan': pekerjaan,
      'nik': nik,
      'kk': kk,
      // 'kategori': kategori,
      'alamat': alamat,
      'rt': rt,
      'rw': rw,
      'kodepos': kodePos,
      'id_provinsi': provinsi,
      'id_kabupaten': kabupaten,
      'id_kecamatan': kecamatan,
      'id_desa': desa
    };
    print('$tag Data Post : $fieldFormURL');
    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.profile,
          headers: apiHeaders(apiToken: token), body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseCreateProfile = Profile.fromJSON(baseResponse.data);

      return ApiReturnValue(
          value: responseCreateProfile, message: baseResponse.message);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag : ${e.toString()}');
      // return ApiReturnValue(message: "Tidak ada koneksi internet!");
      return ApiReturnValue(message: 'Terjadi Kesalahan..');
    }
  }

  //--------------------------------------------------------------------
  //                          UPDATE Profile
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Profile>> update(
      {String token,
        int idUser,
        int idProfile,
        String nama,
        String telp,
        String tglLahir,
        String gender,
        String golDarah,
        String agama,
        String suku,
        String pendidikan,
        String pekerjaan,
        String nik,
        String kk,
        String alamat,
        String rt,
        String rw,
        String kodepos,
        String provinsi,
        String kabupaten,
        String kecamatan,
        String desa}) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idProfile,
      'id_user': idUser,
      'nama': nama,
      'telp': telp,
      'tgl_lahir': tglLahir,
      'gender': gender,
      'gol_darah': golDarah,
      'agama': agama,
      'suku': suku,
      'pendidikan': pendidikan,
      'pekerjaan': pekerjaan,
      'nik': nik,
      'kk': kk,
      'alamat': alamat,
      'rt': rt,
      'rw': rw,
      'kodepos': kodepos,
      'id_provinsi': provinsi,
      'id_kabupaten': kabupaten,
      'id_kecamatan': kecamatan,
      'id_desa': desa
    };
    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.profile,
          headers: apiHeaders(apiToken: token), body: jsonEncode(fieldFormURL));
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseCreateProfile = Profile.fromJSON(baseResponse.data);

      return ApiReturnValue(
          value: responseCreateProfile, message: baseResponse.message);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag : ${e.toString()}');
      return ApiReturnValue(message: 'Terjadi Kesalahan..');
    }
  }

  //--------------------------------------------------------------------
  //                          GET Profile
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Profile>> read({String token, int idProfile}) async {
    print('$tag GET : $idProfile, token = $token');
    print('$tag GET : Headers ${apiHeaders(apiToken: token)}');
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.profile + '/$idProfile',
          headers: apiHeaders(apiToken: token));
      print(
          '$tag GET : ${apiResponse.statusCode}, ${apiResponse.body}, ${apiResponse.headers}');
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataProfil = Profile.fromJSON(baseResponse.data);
      return ApiReturnValue(value: dataProfil, message: baseResponse.message);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          EDIT Photo Profile
  //--------------------------------------------------------------------
  @override
  Future<ApiReturnValue<Profile>> editPhotoProfile(
  {String token, int idProfile, String photoProfile}) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idProfile,
      'foto_profil': photoProfile
    };
    var body = jsonEncode(fieldFormURL);
    print('$tag, $fieldFormURL');

    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.uploadPhoto,
          headers: apiHeaders(apiToken: token), body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataProfil = Profile.fromJSON(baseResponse.data);
      return ApiReturnValue(value: dataProfil, message: baseResponse.message);
    } on SocketException {
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
