part of 'pages.dart';

class ListLahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.watch<GetListLahanCubit>().getListLahan();
    return Scaffold(
      body: BlocBuilder<GetListLahanCubit, GetListLahanState>(
        builder: (_, state) {
          if (state is GetListLahanLoaded) {
            List<Lahan> listLahan = state.lahan.toList();

            if (listLahan.length != 0) {
              return ListView.builder(
                  itemCount: listLahan.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<GetDetailLahanCubit>()
                            .getDetailLahan(listLahan[index].id);
                        Get.to(DetailLahanPage());
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(60 / 2),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Kategori : ${listLahan[index].kategori}',
                                        style: blackFontBoldStyle3),
                                    Text('Luas : ${listLahan[index].luas}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Keterangan : ${listLahan[index].keterangan}',
                                        style: blackFontStyle4),
                                    Text('Alamat : ${listLahan[index].alamat}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Usia Tanam : ${listLahan[index].usiaTanam}',
                                        style: blackFontStyle4),
                                    Text('Satuan : ${listLahan[index].satuan}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Petani : ${listLahan[index].idPetani}',
                                        style: blackFontStyle4),
                                    Text('Desa : ${listLahan[index].desa}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Kecamatan : ${listLahan[index].kecamatan}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Kabupaten : ${listLahan[index].kabupaten}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Provinsi : ${listLahan[index].provinsi}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Latitude : ${listLahan[index].latitude}',
                                        style: blackFontStyle4),
                                    Text(
                                        'Longitude : ${listLahan[index].longitude}',
                                        style: blackFontStyle4),
                                    InkWell(
                                        onTap: () async {
                                          await context
                                              .bloc<DeleteLahanCubit>()
                                              .deleteLahan(listLahan[index].id);
                                        },
                                        child: Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text('Oops belum ada jadwal pembagian pupuk..'),
              );
            }
          } else if (state is GetListLahanFailed) {
            return (Center(
              child: Text('List Lahan gagal dimuat...'),
            ));
          } else {
            return Center(
              child: loadingIndicator,
            );
          }
        },
      ),
    );
  }
}
