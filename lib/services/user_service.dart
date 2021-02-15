part of 'services.dart';

class UserServices {
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

      print('USER SERVICE : ${responseBody.toString()}');
      print(
          'USER SERVICE : ${baseResponse.status}, ${baseResponse.message}, ${baseResponse.data}');
      return ApiReturnValue(
          value: responseLogin, message: baseResponse.message);
    } catch (e) {
      print('USER Exception : ${e.toString()}');
      return ApiReturnValue(message: "Tidak ada koneksi internet!");
    }
  }
}
