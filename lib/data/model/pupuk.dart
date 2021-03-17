part of 'models.dart';

class Pupuk {
  String id;
  String jenis;
  int kapasitas;
  String satuan;
  String idPoktan;
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
      this.idPoktan,
      this.poktan,
      this.petani,
      this.tglDistribusi,
      this.instansi,
      this.keterangan});

  factory Pupuk.fromJSON(Map<String, dynamic> json) {
    return Pupuk(
      id: json['id'].toString()??null,
      jenis: json['jenis_pupuk'],
      kapasitas: json['kapasitas'],
      satuan: json['satuan'],
      idPoktan: json['id_poktan'].toString()??null,
      poktan: json['poktan'],
      petani: json['id_petani'].toString()??null,
      instansi: json['id_instansi'],
      tglDistribusi: json['tgl_distribusi'],
      keterangan: json['keterangan'],
    );
  }
}
