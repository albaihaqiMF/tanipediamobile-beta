part of 'models.dart';

class Panen {
  String id;
  String kategori;
  int luas;
  int satuan;
  String alamat;
  String usiaTanam;
  String idPetani;
  String petani;
  String instansi;
  String desa;
  String kecamatan;
  String kabupaten;
  String provinsi;
  String latitude;
  String longitude;
  String keterangan;

  String varietas;
  int totalPanen;
  String tglTanam;
  String tglPanen;
  String idLahan;

  Panen(
      {this.id,
      this.kategori,
      this.luas,
      this.satuan,
      this.alamat,
      this.usiaTanam,
      this.idPetani,
      this.petani,
      this.instansi,
      this.desa,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      this.latitude,
      this.longitude,
      this.keterangan,
      this.varietas,
      this.totalPanen,
      this.tglTanam,
      this.tglPanen,
      this.idLahan});

  factory Panen.fromJSON(Map<String, dynamic> json) {
    return Panen(
      id: json['id'].toString(),
      kategori: json['kategori'].toString(),
      luas: json['luas'],
      satuan: json['satuan'],
      alamat: json['alamat'],
      usiaTanam: json['usia_tanam'],
      idPetani: json['id_petani'].toString(),
      petani: json['petani'].toString(),
      instansi: json['id_instansi'].toString(),
      desa: json['id_desa'].toString(),
      kecamatan: json['id_kecamatan'].toString(),
      kabupaten: json['id_kabupaten'].toString(),
      provinsi: json['id_provinsi'].toString(),
      latitude: json['latitude'],
      longitude: json['longtitude'],
      keterangan: json['keterangan'],
      varietas: json['varietas'],
      totalPanen: json['total_panen'],
      tglTanam: json['tgl_tanam'],
      tglPanen: json['tgl_panen'],
      idLahan: json['idLahan'],
    );
  }
}
