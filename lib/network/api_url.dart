class ApiUrl {
  // Initial Setup
  static const baseURL = "https://d04929edeaf8.ngrok.io/";
  static const baseURI = "d04929edeaf8.ngrok.io";
  static const contentType = 'application/json';
  static const appKey = 'okYC7opyhD4DTIauhPvMq2Wkvc6bz08t';

  // Header
  // static Map<String, String> headersAuth = {
  //   'Content-Type': ApiUrl.contentType,
  //   'APP-KEY': ApiUrl.appKey,
  //   'Authorization':
  //       'Gradien 859a37720c27b9f70e11b79bab9318fevKy8TIabuW9axMdVdZ4SEfZMKhVrPfGIrTvNpYH2wiQnDaDYwu48T9FRdsfOf4JtRB89HKUTY2HevVmNn1YgNSot5MvUVovVf7yPRh3y96Es7v2cMBgsnyqNuc872nAY'
  // };

  // static Map<String, String> headers = {
  //   'Content-Type': ApiUrl.contentType,
  //   'APP-KEY': ApiUrl.appKey,
  // };

  // End Point URL
  static const login = 'login';
  static const register = 'register';
  static const profile = 'profil';
  static const uploadPhoto = 'profil/image';
  static const jadwalPupuk = 'jadwal-pupuk';
  static const lahan = 'lahan';
  static const panen = 'panen';
  static const wilayah = 'wilayah';
  static const provinsi = '$wilayah/provinsi';
  static const kabupaten = '$wilayah/kabupatenkota';
  static const kecamatan = '$wilayah/kecamatan';
  static const desa = '$wilayah/kelurahan';
}
