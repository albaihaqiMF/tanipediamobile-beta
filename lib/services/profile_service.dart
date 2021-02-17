part of 'services.dart';

class ProfileServices {
  static Future<ApiReturnValue<Profile>> create(
      int idUser,
      String nama,
      int nik,
      int kk,
      String tglLahir,
      int kodePos,
      String rt,
      String rw,
      String gender,
      String golDarah,
      String suku,
      String agama,
      String pendidikan,
      String pekerjaan,
      String kategori,
      String telp) async {
    Map<String, dynamic> fieldFormURL = {
      'id_user': idUser,
      'nama': nama,
      'nik': nik,
      'kk': kk,
      'tgl_lahir': tglLahir,
      'kodepos': kodePos,
      'rt': rt,
      'rw': rw,
      'gender': gender,
      'gol_darah': golDarah,
      'suku': suku,
      'agama': agama,
      'pendidikan': pendidikan,
      'pekerjaan': pekerjaan,
      'kategori': kategori,
      'telp': telp
    };
    print('Data Post : $fieldFormURL');
    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.profile,
          headers: ApiUrl.headersAuth, body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseCreateProfile = Profile.fromJSON(baseResponse.data);

      return ApiReturnValue(
          value: responseCreateProfile, message: baseResponse.message);
    } catch (e) {
      print('PROFILE_SERVICE : ${e.toString()}');
      // return ApiReturnValue(message: "Tidak ada koneksi internet!");
      return ApiReturnValue(message: e.toString());
    }
  }

  static Future<ApiReturnValue<Profile>> read(int idUser) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.profile + '/$idUser',
          headers: ApiUrl.headersAuth);
      print(
          'PROFILE_SERVICE GET : ${apiResponse.statusCode}, ${apiResponse.body}, ${apiResponse.headers}');
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseGetProfile = Profile.fromJSON(baseResponse.data);
      return ApiReturnValue(
          value: responseGetProfile, message: baseResponse.message);
    } catch (e) {
      print('PROFILE_SERVICE Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  static Future<ApiReturnValue<Profile>> editPhotoProfile(
      int idProfile, String photoProfile) async {
    Map<String, dynamic> fieldFormURL = {
      'id': idProfile,
      'foto_profil': photoProfile
    };
    var body = jsonEncode(fieldFormURL);

    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.uploadPhoto,
          headers: ApiUrl.headersAuth, body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseGetProfile = Profile.fromJSON(baseResponse.data);
      return ApiReturnValue(
          value: responseGetProfile, message: baseResponse.message);
    } catch (e) {
      print('PROFILE_SERVICE Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
