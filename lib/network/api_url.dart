class ApiUrl {
  // Initial Setup
  static const baseURL = "https://a6e72adb23b8.ngrok.io/";
  static const baseURI = "a6e72adb23b8.ngrok.io";
  static const contentType = 'application/json';
  static const appKey = 'okYC7opyhD4DTIauhPvMq2Wkvc6bz08t';

  // End Point URL
  static const login = 'login';
  static const user = 'user';
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
