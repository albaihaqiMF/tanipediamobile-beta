part of '../pages.dart';

class DetailPanenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Data Hasil Panen', style: mainFontBoldStyle1),
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
      body: BlocBuilder<GetDetailPanenCubit, GetDetailPanenState>(
          builder: (_, state) {
        if (state is GetDetailPanenLoaded) {
          return SingleChildScrollView(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      width: 70,
                                      height: 70,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image(
                                            image: NetworkImage(
                                                'http://bulelengkab.go.id/assets/instansikab/71/artikel/waspada-serangan-hama-padi-di-musim-hujan-mengintai-16.jpg'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        (state.panen.kategori != null)
                                            ? '${state.panen.kategori}'
                                            : 'Panen',
                                        style: blackFontStyle3),
                                    Text(
                                        (state.panen.totalPanen != null)
                                            ? '${state.panen.totalPanen} Kg'
                                            : '- Kg',
                                        style: blackFontBoldStyle2),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10), Divider(color: Colors.black),

                            Text(
                                (state.panen.kategori != null)
                                    ? 'Jenis Pertanian : ${state.panen.kategori}'
                                    : 'Jenis Pertanian : -',
                                style: blackFontStyle4),
                            // Divider(color: Colors.black),
                            // Text(
                            //     (state.panen.usiaTanam != null)
                            //         ? 'Usia Tanam : ${state.panen.usiaTanam}'
                            //         : 'Usia Tanam : -',
                            //     style: blackFontStyle4),
                            Divider(color: Colors.black),
                            Text(
                                (state.panen.tglTanam != null)
                                    ? 'Tanggal Tanam : ${state.panen.tglTanam}'
                                    : 'Tanggal Tanam : -',
                                style: blackFontStyle4),
                            Text(
                                (state.panen.tglPanen != null)
                                    ? 'Tanggal Panen : ${state.panen.tglPanen}'
                                    : 'Tanggal Panen : -',
                                style: blackFontStyle4),
                            Divider(color: Colors.black),
                            // Text('${state.panen.alamat}', style: blackFontStyle4),
                            // Text('Kelurahan ${state.panen.desa}',
                            //     style: blackFontStyle4),
                            // Text(
                            //     '${state.panen.kabupaten}-${state.panen.kecamatan}'),
                            // Text('Kode Pos ${state.panen.kecamatan}',
                            //     style: blackFontStyle4),
                            // Divider(color: Colors.black),
                            Text(
                                (state.panen.petani != null)
                                    ? 'Penulis : ${state.panen.petani}'
                                    : 'Penulis : -',
                                style: blackFontStyle4),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton2(
                                    onPress: () => onUpdate(context),
                                    text: 'Ubah',
                                    icon: Icons.edit_outlined),
                                CustomButton2(
                                  onPress: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    String apiToken = prefs.getString(
                                        KeySharedPreference.apiToken);
                                    onDelete(context, state.panen.id, apiToken);
                                  },
                                  text: 'Hapus',
                                  icon: Icons.delete_outline_rounded,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetDetailPanenFailed) {
          return (Center(
            child: Text('List Panen gagal dimuat...'),
          ));
        } else {
          return Center(
            child: loadingIndicatorAnim,
          );
        }
      }),
    );
  }

  onUpdate(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(KeySharedPreference.updatePanen, true);
    bool isUpdate = sharedPreferences.getBool(KeySharedPreference.updatePanen);
    if (isUpdate) {
      print('Panen UPDATE Detail : $isUpdate');
      Get.toNamed(AppRoutes.CREATE_PANEN);
    }
  }

  onDelete(BuildContext context, String idPanen, String apiToken) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
          title: 'Konfirmasi',
          description: 'Apakah anda yakin untuk menghapus data panen ini?',
          confirmPress: () async {
            Get.back();
            showProgressDialog(context, 'Mohon tunggu...');
            await context
                .read<DeletePanenCubit>()
                .deletePanen(apiToken, idPanen);
            Get.offNamedUntil(
                AppRoutes.PANEN, ModalRoute.withName(AppRoutes.MAIN));
          },
          cancelPress: () => Get.back()),
    );
  }
}
