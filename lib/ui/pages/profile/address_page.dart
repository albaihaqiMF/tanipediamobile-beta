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
      body: (alamat == null &&
              rt == null &&
              rw == null &&
              desa == null &&
              kecamatan == null &&
              kabupaten == null &&
              provinsi == null)
          ? Center(child: Text('Anda belum mengisi alamat'))
          : (stateProfile is ProfileInitial)
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
                            'Alamat Saya',
                            style: mainFontBoldStyle1,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        (nama != null) ? nama : '-',
                        style: blackFontStyle3,
                      ),
                      Text(
                        (alamat != null) ? alamat : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (rt != null) ? 'RT.$rt' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (rw != null) ? 'RW.$rw' : '-',
                        style: blackFontStyle4,
                      ),
                      Text(
                        (desa != null) ? 'Desa $desa' : '-',
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
                      Container(
                        width: 140,
                        height: 50,
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onTap: () {},
                          child: Card(
                              color: mainColor,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Ubah',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
