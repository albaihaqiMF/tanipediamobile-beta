part of 'models.dart';

class Profile {
  final String id;
  final String nama;
  final String nik;
  final String kk;
  final String kategori;
  final String pekerjaan;
  final String gender;
  final String agama;
  final String suku;
  final String tglLahir;
  final String pendidikan;
  final String alamat;
  final String rt;
  final String rw;
  final String desa;
  final String kecamatan;
  final String kabupaten;
  final String provinsi;
  final String kodepos;
  // final int latitude;
  // final int longtitude;
  final String fotoProfil;
  // final String fotoKtp;
  // final String fotoKK;
  final String golDarah;
  final String telepon;
  // final String email;
  // final String facebook;
  final int idUser;

  Profile({
    this.id,
    this.idUser,
    this.nama,
    this.nik,
    this.pekerjaan,
    this.pendidikan,
    this.agama,
    this.suku,
    this.telepon,
    this.tglLahir,
    this.gender,
    this.golDarah,
    this.kategori,
    this.kk,
    this.kodepos,
    this.alamat,
    // this.latitude,
    // this.longtitude,
    this.rt,
    this.rw,
    this.desa,
    this.kabupaten,
    this.kecamatan,
    this.provinsi,
    // this.fotoKK,
    // this.fotoKtp,
    this.fotoProfil,
    // this.email,
    // this.facebook,
  });

  // @override
  // List<Object> get props => throw UnimplementedError();

  factory Profile.fromJSON(Map<String, dynamic> json) {
    return Profile(
      id: json['id'].toString(),
      idUser: json['id_user'],
      nama: json['nama'],
      nik: json['nik'].toString(),
      pekerjaan: json['pekerjaan'].toString(),
      pendidikan: json['pendidikan'].toString(),
      agama: json['agama'].toString(),
      suku: json['suku'].toString(),
      telepon: json['telp'].toString(),
      tglLahir: json['tgl_lahir'],
      gender: json['gender'].toString(),
      golDarah: json['gol_darah'].toString(),
      kategori: json['kategori'].toString(),
      kk: json['kk'].toString(),
      kodepos: json['kodepos'].toString(),
      alamat: json['alamat'],
      // latitude: json['latitude'],
      // longtitude: json['longtitude'],
      rt: json['rt'],
      rw: json['rw'],
      desa: json['id_desa'],
      kecamatan: json['id_kecamatan'],
      kabupaten: json['id_kabupaten'],
      provinsi: json['id_provinsi'],
      // fotoKK: json['foto_kk'],
      // fotoKtp: json['foto_ktp'],
      fotoProfil: json['foto_profil'],
      // facebook: json['facebook'],
      // email: json['email'],
    );
  }
}
