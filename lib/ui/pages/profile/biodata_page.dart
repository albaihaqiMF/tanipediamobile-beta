part of '../pages.dart';

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileState stateProfile = context.watch<ProfileCubit>().state;
    final data = (context.watch<ProfileCubit>().state as ProfileLoaded);
    String tglLahir = data.profile.tglLahir;
    String gender = data.profile.gender;
    String agama = data.profile.agama;
    String suku = data.profile.suku;
    String pekerjaan = data.profile.pekerjaan;
    String pendidikan = data.profile.pendidikan;
    String kategori = data.profile.kategori;
    String kk = data.profile.kk;
    String nik = data.profile.nik;
    String kodePos = data.profile.kodepos;
    String golDarah = data.profile.golDarah;

    return Scaffold(
      backgroundColor: Colors.white,
      body: (stateProfile is ProfileInitial)
          ? loadingIndicator
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
                                      'Kategori',
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
                                    SizedBox(height: 10),
                                    Text(
                                      'Kode Pos',
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
                                    (kategori != null) ? kategori : '-',
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
                                  SizedBox(height: 10),
                                  Text(
                                    (kodePos != null) ? kodePos : '-',
                                    style: blackFontStyle4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton2(
                              onPress: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => CommingSoonDialog());
                              },
                              text: 'Ubah',
                              icon: Icons.edit_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
