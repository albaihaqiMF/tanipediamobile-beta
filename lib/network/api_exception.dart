import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tanipedia_mobile_app/model/base/response.dart';
import 'dart:convert';

// Response
class ReturnResponse {
  static const String tag = 'NETWORK_EXCEPTION';
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
        print('$tag : ${response.body.toString()}');
        throw BadRequestException(responseJSON.message);

      case 401:
        print('$tag : ${response.body.toString()}');
        throw UnauthorisedException();

      case 403:
        print('$tag ${response.body.toString()}');
        print('$tag ${response.statusCode.toString()}');
        throw InvalidInputException();

      case 404:
        print('$tag ${response.body.toString()}');
        print('$tag ${response.statusCode.toString()}');
        throw AddressNotFoundException();

      case 500:
        final responseJSON = Response.fromJSON(json.decode(responseBody));
        print('$tag : ${response.body.toString()}');
        throw InternalServerErrorException(responseJSON.message);

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._prefix, this._message]);

  String toString() {
    if(_message!=null){
      return "$_prefix$_message";
    } else {
      return "$_prefix";
    }
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super("Error during Communication:", message);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super("Permintaan Ditolak, pesan: ", message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super("Anda harus login terlebih dahulu.", message);
}

class AddressNotFoundException extends AppException {
  AddressNotFoundException([String message])
      : super("Alamat tidak ditemukan.", message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super("Invalid Input: ", message);
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String message])
      : super("Internal Server Error: ", message);
}
