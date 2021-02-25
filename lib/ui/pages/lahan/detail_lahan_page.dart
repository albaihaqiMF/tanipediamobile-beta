part of '../pages.dart';

class DetailLahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetDetailLahanState state = context.watch<GetDetailLahanCubit>().state;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text('Detail Lahan Pertanian', style: mainFontBoldStyle1),
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
        body: Scaffold(
          body: (state is GetDetailLahanLoaded)
              ? SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    (state.lahan.luas != null)
                                        ? 'Varietas : ${state.lahan.kategori}'
                                        : 'Varietas : -',
                                    style: blackFontStyle4),
                                SizedBox(height: 10),
                                Text(
                                    (state.lahan.luas != null)
                                        ? 'Luas Lahan : ${state.lahan.luas}m²'
                                        : 'Luas Lahan : -',
                                    style: blackFontStyle4),
                                SizedBox(height: 10),
                                Text(
                                    (state.lahan.usiaTanam != null)
                                        ? 'Usia Pertanian : ${state.lahan.usiaTanam} minggu'
                                        : 'Usia Pertanian : -',
                                    style: blackFontStyle4),
                                SizedBox(height: 10),
                                Text('Alamat Pertanian',
                                    style: blackFontBoldStyle4),
                                Text(
                                    (state.lahan.alamat != null)
                                        ? '${state.lahan.alamat}'
                                        : '',
                                    style: blackFontStyle4),
                                Text(
                                    (state.lahan.desa != null)
                                        ? 'Kelurahan ${state.lahan.desa}'
                                        : '',
                                    style: blackFontStyle4),
                                Text(
                                    (state.lahan.kabupaten != null)
                                        ? '${state.lahan.kabupaten} - ${state.lahan.kecamatan}'
                                        : '',
                                    style: blackFontStyle4),
                                Text(
                                    (state.lahan.kodepos != null)
                                        ? 'Kode Pos ${state.lahan.kodepos}'
                                        : 'Kode Pos : -',
                                    style: blackFontStyle4),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton2(
                                        onPress: () {},
                                        text: 'Ubah',
                                        icon: Icons.edit_outlined),
                                    CustomButton2(
                                        onPress: () {},
                                        text: 'Hapus',
                                        icon: Icons.delete_outline,
                                        color: Colors.red),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : loadingIndicator,
        ));
  }
}
