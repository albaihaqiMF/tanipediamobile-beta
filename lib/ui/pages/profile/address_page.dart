part of '../pages.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileState stateProfile = context.watch<ProfileCubit>().state;
    final data = (context.watch<ProfileCubit>().state as ProfileLoaded);
    String nama = data.profile.nama;
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Alamat Saya', style: mainFontBoldStyle1),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: mainColor),
                onPressed: () => Get.back()),
          ),
        ),
      ),
      body:
          // (alamat == null &&
          //         rt == null &&
          //         rw == null &&
          //         desa == null &&
          //         kecamatan == null &&
          //         kabupaten == null &&
          //         provinsi == null)
          //     ? Center(child: Text('Anda belum mengisi alamat'))
          //     :
          (stateProfile is ProfileInitial)
              ? loadingIndicator
              : Container(
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (nama != null) ? nama : '-',
                        style: blackFontBoldStyle3,
                      ),
                      SizedBox(height: 10),
                      Text(
                        (alamat != null) ? alamat : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (rt != null) ? 'RT. $rt' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (rw != null) ? 'RW. $rw' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (desa != null) ? 'Kelurahan $desa' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (kabupaten != null) ? '$kabupaten - $kecamatan' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (provinsi != null) ? 'Provinsi $provinsi' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (kodepos != null) ? 'Kode Pos $kodepos' : '-',
                        style: blackFontStyle4,
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
                          icon: Icons.edit_outlined)
                    ],
                  ),
                ),
    );
  }
}
