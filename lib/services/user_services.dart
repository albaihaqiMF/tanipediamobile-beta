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
          headers: ApiUrl.headers, body: body);

      // final responseBody = json.decode(apiResponse.body.toString());
      final responseBody = ReturnResponse.response(apiResponse);
      // response Data/Base
      final baseResponse = Response.fromJSON(responseBody);
      // response User
      var responseLogin = User.fromJSON(baseResponse.data);

      print('$tag : ${responseBody.toString()}');
      print(
          '$tag : ${baseResponse.status}, ${baseResponse.message}, ${baseResponse.data}');
      return ApiReturnValue(
          value: responseLogin, message: baseResponse.message);
    } catch (e) {
      print('$tag : ${e.toString()}');
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
