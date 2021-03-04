part of '../pages.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {

  @override
  Widget build(BuildContext context) {
    ProfileState stateProfile = context.watch<ProfileCubit>().state;
    final data = (context.watch<ProfileCubit>().state as ProfileLoaded);
    int idUser = data.profile.idUser;
    String nama = data.profile.nama;
    String tglLahir = data.profile.tglLahir;
    String gender = data.profile.gender;
    String agama = data.profile.agama;
    String suku = data.profile.suku;
    String pekerjaan = data.profile.pekerjaan;
    String pendidikan = data.profile.pendidikan;
    String kk = data.profile.kk;
    String nik = data.profile.nik;
    String golDarah = data.profile.golDarah;
    String telp = data.profile.telepon;
    // Address
    String alamat = data.profile.alamat;
    String rt = data.profile.rt;
    String rw = data.profile.rw;
    String desa = data.profile.desa;
    String kecamatan = data.profile.kecamatan;
    String kabupaten = data.profile.kabupaten;
    String provinsi = data.profile.provinsi;
    String kodepos = data.profile.kodepos;

    return Scaffold(
      backgroundColor: Colors.white,
      body: (stateProfile is ProfileInitial)
          ? loadingIndicatorAnim
          : Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: mainColor,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Data Diri',
                        style: mainFontBoldStyle1,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    (nama != null) ? nama : '-',
                    style: blackFontBoldStyle2,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tanggal Lahir',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Jenis Kelamin',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Golongan Darah',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Agama',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Suku',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Pekerjaan',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Pendidikan',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Nomor KK',
                                      style: greyFontStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'NIK',
                                      style: greyFontStyle,
                                    ),
                                  ]),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    (tglLahir != null) ? tglLahir : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (gender != null) ? gender : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (golDarah != null) ? golDarah : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (agama != null) ? agama : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (suku != null) ? suku : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (pekerjaan != null) ? pekerjaan : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (pendidikan != null) ? pendidikan : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (kk != null) ? kk : '-',
                                    style: blackFontStyle4,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (nik != null) ? nik : '-',
                                    style: blackFontStyle4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Alamat',
                    style: blackFontBoldStyle2,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(14),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            (alamat != null) ? alamat : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 10),
                          Text(
                            (rt != null) ? 'RT. $rt' : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 10),
                          Text(
                            (rw != null) ? 'RW. $rw' : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 10),
                          Text(
                            (desa != null) ? 'Kelurahan $desa' : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 5),
                          Text(
                            (kabupaten != null)
                                ? '$kabupaten - $kecamatan'
                                : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 5),
                          Text(
                            (provinsi != null) ? 'Provinsi $provinsi' : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 10),
                          Text(
                            (kodepos != 'null') ? 'Kode Pos $kodepos' : '-',
                            style: blackFontStyle4,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton2(
                      onPress: () {
                        Get.toNamed(AppRoutes.CREATE_PROFILE_PAGE1,
                            arguments: [true, idUser, telp]);
                      },
                      text: 'Ubah',
                      icon: Icons.edit_outlined),
                ],
              ),
            ),
    );
  }
}
