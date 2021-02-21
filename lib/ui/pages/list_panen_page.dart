part of 'pages.dart';

class ListPanenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.watch<GetPanenCubit>().getListPanen();
    return Scaffold(
      body: BlocBuilder<GetPanenCubit, GetPanenState>(builder: (_, state) {
        if (state is GetListPanenLoaded) {
          List<Panen> listPanen = state.panen.toList();
          if (listPanen.length != null) {
            return ListView.builder(
                itemCount: listPanen.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<GetDetailPanenCubit>()
                          .getDetailPanen(listPanen[index].id);
                      Get.to(DetailPanenPage());
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
                                Text('Kategori : ${listPanen[index].kategori}',
                                    style: blackFontBoldStyle3),
                                Text('Luas : ${listPanen[index].luas}',
                                    style: blackFontBoldStyle3),
                                Text('Satuan : ${listPanen[index].satuan}',
                                    style: blackFontStyle4),
                                Text('Alamat : ${listPanen[index].alamat}',
                                    style: blackFontStyle4),
                                Text(
                                    'Usia Tanam : ${listPanen[index].usiaTanam}',
                                    style: blackFontStyle4),
                                Text('Id Petani : ${listPanen[index].idPetani}',
                                    style: blackFontStyle4),
                                Text('Petani : ${listPanen[index].petani}',
                                    style: blackFontStyle4),
                                Text('Desa : ${listPanen[index].desa}',
                                    style: blackFontStyle4),
                                Text(
                                    'Kecamatan : ${listPanen[index].kecamatan}',
                                    style: blackFontStyle4),
                                Text(
                                    'Kabupaten : ${listPanen[index].kabupaten}',
                                    style: blackFontStyle4),
                                Text('Provinsi : ${listPanen[index].provinsi}',
                                    style: blackFontStyle4),
                                Text('Latitude : ${listPanen[index].latitude}',
                                    style: blackFontStyle4),
                                Text(
                                    'Longitude : ${listPanen[index].longitude}',
                                    style: blackFontStyle4),
                                Text(
                                    'Keterangan : ${listPanen[index].keterangan}',
                                    style: blackFontStyle4),
                                InkWell(
                                    onTap: () async {
                                      await context
                                          .bloc<DeletePanenCubit>()
                                          .deleteLahan(listPanen[index].id);
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                  );
                });
          } else {
            return Center(
              child: Text('Oops belum ada data panen..'),
            );
          }
        } else if (state is GetListPanenFailed) {
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
