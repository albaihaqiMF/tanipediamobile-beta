part of 'models.dart';

class Pupuk {
  String id;
  String jenis;
  int kapasitas;
  int satuan;
  String poktan;
  String petani;
  String instansi;
  String tglDistribusi;
  String keterangan;

  Pupuk(
      {this.id,
      this.jenis,
      this.kapasitas,
      this.satuan,
      this.poktan,
      this.petani,
      this.tglDistribusi,
      this.instansi,
      this.keterangan});

  factory Pupuk.fromJSON(Map<String, dynamic> json) {
    return Pupuk(
      id: json['id'].toString(),
      jenis: json['jenis_pupuk'],
      kapasitas: json['kapasitas'],
      satuan: json['satuan'],
      poktan: json['id_poktan'].toString(),
      petani: json['id_petani'].toString(),
      instansi: json['id_instansi'].toString(),
      tglDistribusi: json['tgl_distribusi'],
      keterangan: json['keterangan'],
    );
  }
}
