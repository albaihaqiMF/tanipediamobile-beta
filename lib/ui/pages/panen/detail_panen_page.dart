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
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(
                                          image: AssetImage("assets/padi.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Text('Varietas : ${state.panen.varietas}',
                                      style: blackFontStyle3),
                                  Text('Satuan : ${state.panen.satuan}',
                                      style: blackFontBoldStyle2),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: Colors.black),
                          Text('Jenis Pertanian : ${state.panen.kategori}',
                              style: blackFontStyle4),
                          Divider(color: Colors.black),
                          Text('Tanggal Tanam : ${state.panen.tglTanam}',
                              style: blackFontStyle4),
                          Text('Tanggal Panen : ${state.panen.tglPanen}',
                              style: blackFontStyle4),
                          Divider(color: Colors.black),
                          Text('${state.panen.alamat}, ${state.panen.desa}',
                              style: blackFontStyle4),
                          Text(
                              '${state.panen.kabupaten}-${state.panen.kecamatan}'),
                          Text('Kode Pos ${state.panen.kecamatan}',
                              style: blackFontStyle4),
                          Divider(color: Colors.black),
                          Text('Penulis: ${state.panen.petani}',
                              style: blackFontStyle4),
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    Container(
                      width: 140,
                      height: 50,
                      child: InkWell(
                        highlightColor: Colors.red[900],
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onTap: () {},
                        child: Card(
                            color: Colors.red,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text('Hapus',
                                    style: TextStyle(color: Colors.white))
                              ],
                            )),
                      ),
                    ),
                  ],
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
