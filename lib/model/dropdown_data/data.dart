import 'package:smart_select/smart_select.dart';

class LocalData {
  static List<S2Choice<String>> agama = [
    S2Choice<String>(value: '1000201', title: 'Islam'),
    S2Choice<String>(value: '1000202', title: 'Kristen'),
    S2Choice<String>(value: '1000203', title: 'Katolik'),
    S2Choice<String>(value: '1000204', title: 'Hindu'),
    S2Choice<String>(value: '1000205', title: 'Budha'),
  ];

  static List<S2Choice<String>> suku = [
    S2Choice<String>(value: '1000501', title: 'Jawa'),
    S2Choice<String>(value: '1000502', title: 'Sunda'),
    S2Choice<String>(value: '1000503', title: 'Lampung'),
    S2Choice<String>(value: '1000504', title: 'Bugis'),
    S2Choice<String>(value: '1000505', title: 'Palembang'),
    S2Choice<String>(value: '1000506', title: 'Padang'),
  ];

  static List<S2Choice<String>> pendidikan = [
    S2Choice<String>(value: '1000301', title: 'Tidak Sekolah'),
    S2Choice<String>(value: '1000301', title: 'SD'),
    S2Choice<String>(value: '1000303', title: 'SMP'),
    S2Choice<String>(value: '1000304', title: 'SMA'),
    S2Choice<String>(value: '1000305', title: 'S1'),
    S2Choice<String>(value: '1000306', title: 'S2'),
    S2Choice<String>(value: '1000307', title: 'S3'),
  ];

  static List<S2Choice<String>> pekerjaan = [
    S2Choice<String>(value: '1000601', title: 'Petani'),
    S2Choice<String>(value: '1000601', title: 'Buruh'),
    S2Choice<String>(value: '1000603', title: 'ASN'),
    S2Choice<String>(value: '1000604', title: 'Pedagang'),
    S2Choice<String>(value: '1000605', title: 'Penyuluh'),
    S2Choice<String>(value: '1000606', title: 'Dosen'),
    S2Choice<String>(value: '1000607', title: 'Pegawai Swasta'),
    S2Choice<String>(value: '1000608', title: 'Honorer'),
  ];
}
