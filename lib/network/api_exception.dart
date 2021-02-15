part of 'network.dart';

// Response
class ReturnResponse {
  static response(http.Response response) {
    final responseBody = response.body.toString();
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(responseBody);
        print('CREATE_200 : $responseJson');
        return responseJson;

      case 201:
        var responseJson = json.decode(responseBody);
        print('CREATED_201 : $responseJson');
        return responseJson;

      case 400:
        final responseJSON = Response.fromJSON(json.decode(responseBody));
        print('NETWORK_EXCEPTION : ${response.body.toString()}');
        throw BadRequestException(responseJSON.message);

      case 401:
        print('NETWORK_EXCEPTION : ${response.body.toString()}');
        throw UnauthorisedException('Anda harus login terlebih dahulu.');

      case 403:
        //final responseJSON = Response.fromJSON(json.decode(responseBody));
        print('NETWORK_EXCEPTION ${response.body.toString()}');
        print('NETWORK_EXCEPTION ${response.statusCode.toString()}');
        throw InvalidInputException('Anda tidak memiliki akses.');

      case 404:
        //final responseJSON = Response.fromJSON(json.decode(responseBody));
        print('NETWORK_EXCEPTION ${response.body.toString()}');
        print('NETWORK_EXCEPTION ${response.statusCode.toString()}');
        throw AddressNotFoundException('Alamat URL tidak ditemukan.');

      case 500:
        print('NETWORK_EXCEPTION : ${response.body.toString()}');
        throw InternalServerErrorException('Terjadi Kesalahan');

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

class AddressNotFoundException extends AppException {
  AddressNotFoundException([String message])
      : super(message, "Address Not Found: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String message])
      : super(message, "Internal Server Error: ");
}
