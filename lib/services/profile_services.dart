part of 'services.dart';

class ProfileServices {
  static const String tag = 'PROFILE_SERVICE';

  //--------------------------------------------------------------------
  //                          CREATE Profile
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Profile>> create(
      String token,
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
      String desa) async {
    // assert(nama != null);
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
    print('Data Post : $fieldFormURL');
    var body = jsonEncode(fieldFormURL);
    print('Data Post Encoded : $body');
    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.profile,
          headers: apiHeaders(apiToken: token), body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseCreateProfile = Profile.fromJSON(baseResponse.data);

      return ApiReturnValue(
          value: responseCreateProfile, message: baseResponse.message);
    } catch (e) {
      print('$tag : ${e.toString()}');
      // return ApiReturnValue(message: "Tidak ada koneksi internet!");
      return ApiReturnValue(message: 'Terjadi Kesalahan..');
    }
  }

  //--------------------------------------------------------------------
  //                          GET Profile
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Profile>> read(String token, String idUser) async {
    try {
      final apiResponse = await http.get(
          ApiUrl.baseURL + ApiUrl.profile + '/' + idUser,
          headers: apiHeaders(apiToken: token));
      print(
          '$tag GET : ${apiResponse.statusCode}, ${apiResponse.body}, ${apiResponse.headers}');
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final dataProfil = Profile.fromJSON(baseResponse.data);
      return ApiReturnValue(value: dataProfil, message: baseResponse.message);
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          EDIT Photo Profile
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<Profile>> editPhotoProfile(String token,
      String idProfile, String photoProfile) async {
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
    } catch (e) {
      print('$tag Exception : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }
}
