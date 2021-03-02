part of 'services.dart';

class UserServices {
  static const String tag = 'USER_SERVICE';

  //--------------------------------------------------------------------
  //                          REGISTER User
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<User>> register(
      String username, String password) async {
    Map<String, String> fieldFormURL = {
      'username': username,
      'password': password
    };

    var body = jsonEncode(fieldFormURL);

    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.register,
          headers: apiHeaders(), body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      var responseLogin = User.fromJSON(baseResponse.data);
      print('$tag : ${responseBody.toString()}');
      print(
          '$tag : ${baseResponse.status}, ${baseResponse.message}, ${baseResponse.data}');
      return ApiReturnValue(
          value: responseLogin, message: baseResponse.status);
    } catch (e) {
      print('$tag : ${e.toString()}');
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  //--------------------------------------------------------------------
  //                          VERIFY User
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<User>> verifyUser(String token) async {
    try {
      final apiResponse = await http.get(ApiUrl.baseURL + ApiUrl.login,
          headers: apiHeaders(apiToken: token));
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      var responseLogin = User.fromJSON(baseResponse.data);
      return ApiReturnValue(
          value: responseLogin, message: baseResponse.message);
    } catch (e) {
      print('$tag : ${e.toString()}');
      return ApiReturnValue(message: e.toString());
    }
  }

  //--------------------------------------------------------------------
  //                          LOGIN User
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<User>> login(
      String username, String password) async {
    Map<String, String> fieldFormURL = {
      'username': username,
      'password': password
    };
    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.login,
          headers: apiHeaders(), body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);

      if (baseResponse.status == 'OK') {
        var responseLogin = User.fromJSON(baseResponse.data);
        return ApiReturnValue(value: responseLogin);
      } else {
        return ApiReturnValue(message: baseResponse.message);
      }
    } catch (e) {
      print('$tag : ${e.toString()}');
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }

  //--------------------------------------------------------------------
  //                          UPDATE User
  //--------------------------------------------------------------------
  static Future<ApiReturnValue<User>> update(String token,
      String idUser, String idProfile, String noTelp) async {
    Map<String, String> fieldFormURL = {
      'id': idUser,
      'id_profil': idProfile,
      'telp':noTelp
    };
    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.put(ApiUrl.baseURL + ApiUrl.user,
          headers: apiHeaders(apiToken: token), body: body);
      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
        var responseLogin = User.fromJSON(baseResponse.data);
        return ApiReturnValue(value: responseLogin);

    } catch (e) {
      print('$tag : ${e.toString()}');
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
