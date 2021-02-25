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
          return Container(
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
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(
                                          image:
                                              AssetImage("assets/img_padi.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text('${state.panen.kategori}',
                                      style: blackFontStyle3),
                                  Text('${state.panen.satuan} Kwintal',
                                      style: blackFontBoldStyle2),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.black),
                          Text('Jenis Pertanian : ${state.panen.varietas}',
                              style: blackFontStyle4),
                          Divider(color: Colors.black),
                          Text('Tanggal Tanam : ${state.panen.tglTanam}',
                              style: blackFontStyle4),
                          Text('Tanggal Panen : ${state.panen.tglPanen}',
                              style: blackFontStyle4),
                          Divider(color: Colors.black),
                          Text('${state.panen.alamat}', style: blackFontStyle4),
                          Text('Kelurahan ${state.panen.desa}',
                              style: blackFontStyle4),
                          Text(
                              '${state.panen.kabupaten}-${state.panen.kecamatan}'),
                          Text('Kode Pos ${state.panen.kecamatan}',
                              style: blackFontStyle4),
                          Divider(color: Colors.black),
                          Text('Penulis: ${state.panen.petani}',
                              style: blackFontStyle4),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton2(
                                  onPress: () {},
                                  text: 'Ubah',
                                  icon: Icons.edit_outlined),
                              CustomButton2(
                                onPress: () {},
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
          );
        } else if (state is GetDetailPanenFailed) {
          return (Center(
            child: Text('List Panen gagal dimuat...'),
          ));
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      }),
    );
  }
}
