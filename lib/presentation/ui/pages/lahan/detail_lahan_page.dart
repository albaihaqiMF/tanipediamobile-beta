part of '../pages.dart';

class DetailLahanPage extends StatefulWidget {
  @override
  _DetailLahanPageState createState() => _DetailLahanPageState();
}

class _DetailLahanPageState extends State<DetailLahanPage> {
  String apiToken;

  setUpdateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(KeySharedPreference.updateLahan, false);
    print('Lahan UPDATE : ');
    apiToken = prefs.getString(KeySharedPreference.apiToken);
  }

  @override
  Widget build(BuildContext context) {
    setUpdateData();
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
                                    (state.lahan.kategori != null)
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
                                        : '-',
                                    style: blackFontStyle4),
                                Text(
                                    (state.lahan.kabupaten != null)
                                        ? '${state.lahan.kabupaten} - ${state.lahan.kecamatan}'
                                        : '',
                                    style: blackFontStyle4),
                                // Text(
                                //     (state.lahan.kodepos != null)
                                //         ? 'Kode Pos ${state.lahan.kodepos}'
                                //         : 'Kode Pos : -',
                                //     style: blackFontStyle4),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton2(
                                        onPress: () =>
                                            onUpdate(context, state.lahan.id),
                                        text: 'Ubah',
                                        icon: Icons.edit_outlined),
                                    CustomButton2(
                                        onPress: () => onDelete(
                                            context, state.lahan.id, apiToken),
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
              : Center(child:loadingIndicatorAnim),
        ));
  }

  onUpdate(BuildContext context, String idLahan) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(KeySharedPreference.updateLahan, true);
    bool isUpdate = sharedPreferences.getBool(KeySharedPreference.updateLahan);
    if (isUpdate) {
      print('Lahan UPDATE Detail : $isUpdate');
      Get.toNamed(AppRoutes.CREATE_LAHAN);
    }
  }

  onDelete(BuildContext context, String idLahan, String apiToken) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
          title: 'Konfirmasi',
          description: 'Apakah anda yakin untuk menghapus lahan ini ?',
          confirmPress: () async {
            Get.back();
            showProgressDialog(context, 'Mohon tunggu...');
            await context
                .read<DeleteLahanCubit>()
                .deleteLahan(apiToken, idLahan);
            Get.offNamedUntil(
                AppRoutes.LAHAN, ModalRoute.withName(AppRoutes.MAIN));
          },
          cancelPress: () => Get.back()),
    );
  }
}
