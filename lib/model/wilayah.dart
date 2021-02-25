part of 'models.dart';

class Wilayah {
  String id;
  String name;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String desa;
  Wilayah(
      {this.id,
      this.name,
      this.provinsi,
      this.kabupaten,
      this.kecamatan,
      this.desa});

  factory Wilayah.fromJSON(Map<String, dynamic> json) {
    return Wilayah(
      id: json['id'].toString(),
      name: json['nama'],
      provinsi: json['provinsi'].toString(),
      kabupaten: json['kabupatenkota'].toString(),
      kecamatan: json['kecamatan'].toString(),
      desa: json['kelurahan'].toString(),
    );
  }
}
