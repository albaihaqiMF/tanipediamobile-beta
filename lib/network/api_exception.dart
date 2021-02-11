part of 'network.dart';

// Response
class ReturnResponse {
  static response(http.Response response) {
    final responseBody = response.body.toString();
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(responseBody);
        print('API_BASE : $responseJson');
        return responseJson;

      case 201:
        var responseJson = json.decode(responseBody);
        print('API_BASE : $responseJson');
        return responseJson;

      case 400:
        final responseJSON = Response.fromJSON(json.decode(responseBody));
        print('APIBASE : ${response.body.toString()}');
        throw BadRequestException(responseJSON.message);

      case 401:
        throw UnauthorisedException(response.body.toString());

      case 403:
        final responseJSON = Response.fromJSON(json.decode(responseBody));
        print(response.body.toString());
        print(response.statusCode.toString());
        throw InvalidInputException(responseJSON.message);

      case 500:
        throw InternalServerErrorException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Bad Request, message: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorized: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String message])
      : super(message, "Internal Server Error: ");
}
