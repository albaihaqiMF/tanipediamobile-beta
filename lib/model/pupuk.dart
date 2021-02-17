class Pupuk {
  String id;
  String jenis;
  int kapasitas;
  int satuan;
  String idPoktan;
  String idPetani;
  String idInstansi;
  String tglDistribusi;
  String keterangan;

  Pupuk(
      {this.id,
      this.jenis,
      this.kapasitas,
      this.satuan,
      this.idPoktan,
      this.idPetani,
      this.tglDistribusi,
      this.idInstansi,
      this.keterangan});

  factory Pupuk.fromJSON(Map<String, dynamic> json) {
    return Pupuk(
      id: json['id'].toString(),
      jenis: json['jenis_pupuk'],
      kapasitas: json['kapasitas'],
      satuan: json['satuan'],
      idPoktan: json['id_poktan'].toString(),
      idPetani: json['id_petani'].toString(),
      idInstansi: json['id_instansi'].toString(),
      tglDistribusi: json['tgl_distribusi'],
      keterangan: json['keterangan'],
    );
  }
}
