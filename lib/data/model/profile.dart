part of 'models.dart';

class Profile {
  final int id;
  // Page 1
  final int idUser;
  final String nama;
  final String telepon;
  final String tglLahir;
  final String gender;
  final String golDarah;
  final String agama;
  final String suku;
  final String pendidikan;
  final String pekerjaan;
  // Page 2
  final String nik;
  final String kk;
  // Page 3
  final String alamat;
  final String kodepos;
  final String rt;
  final String rw;
  final String desa;
  final String kecamatan;
  final String kabupaten;
  final String provinsi;

  // Etc.
  // final int latitude;
  // final int longtitude;
  final String fotoProfil;
  // final String fotoKtp;
  // final String fotoKK;
  // final String email;
  // final String facebook;

  final String kategori;

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

  factory Profile.fromJSON(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
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
      desa: json['desa'],
      kecamatan: json['kecamatan'],
      kabupaten: json['kabupaten'],
      provinsi: json['provinsi'],
      // fotoKK: json['foto_kk'],
      // fotoKtp: json['foto_ktp'],
      fotoProfil: json['foto_profil'],
      // facebook: json['facebook'],
      // email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_user': idUser,
      'nama': nama,
      'nik': nik,
      'pekerjaan': pekerjaan,
      'pendidikan': pendidikan,
      'agama': agama,
      'suku': suku,
      'telepon': telepon,
      'tgl_lahir': tglLahir,
      'gender': gender,
      'gol_darah': golDarah,
      'kategori': kategori,
      'kk': kk,
      'kodepos': kodepos,
      'alamat': alamat,
      'rt': rt,
      'rw': rw,
      'desa': desa,
      'kecamatan': kecamatan,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'foto_profil': fotoProfil,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id':1,
      'id_profile': id,
      'name': nama,
    };
  }
}
