part of 'models.dart';

class Lahan {
  String id;
  String kategori;
  int luas;
  String satuan;
  String alamat;
  String usiaTanam;
  String idPetani;
  String instansi;
  String desa;
  String kecamatan;
  String kabupaten;
  String provinsi;
  String latitude;
  String longitude;
  String keterangan;
  String kodepos;

  Lahan(
      {this.id,
      this.kategori,
      this.luas,
      this.satuan,
      this.alamat,
      this.usiaTanam,
      this.idPetani,
      this.instansi,
      this.desa,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      this.latitude,
      this.longitude,
      this.keterangan,
      this.kodepos});

  factory Lahan.fromJSON(Map<String, dynamic> json) {
    return Lahan(
        id: json['id'].toString(),
        kategori: json['kategori'],
        luas: json['luas'],
        satuan: json['satuan'],
        alamat: json['alamat'],
        usiaTanam: json['usia_tanam'],
        idPetani: json['id_petani'].toString(),
        instansi: json['id_instansi'].toString(),
        desa: json['desa'],
        kecamatan: json['kecamatan'],
        kabupaten: json['kabupaten'],
        provinsi: json['provinsi'],
        kodepos: json['kodepos'],
        latitude: json['latitude'],
        longitude: json['longtitude'],
        keterangan: json['keterangan']);
  }
}
