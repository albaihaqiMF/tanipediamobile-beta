part of '../pages.dart';

class ListPanenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.watch<GetPanenCubit>().getListPanen();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Hasil Panen', style: mainFontBoldStyle1),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<GetPanenCubit, GetPanenState>(builder: (_, state) {
        if (state is GetListPanenLoaded) {
          List<Panen> listPanen = state.panen.toList();
          if (listPanen.length != null) {
            return ListView.builder(
                itemCount: listPanen.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<GetDetailPanenCubit>().toInitial();
                      context
                          .read<GetDetailPanenCubit>()
                          .getDetailPanen(listPanen[index].id);
                      Get.to(DetailPanenPage());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Row(
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Kategori : ${listPanen[index].kategori}',
                                          style: blackFontStyle4),
                                      // Text('Luas : ${listPanen[index].luas}',
                                      //     style: blackFontBoldStyle3),
                                      Text(
                                          'Satuan : ${listPanen[index].satuan}',
                                          style: blackFontBoldStyle4),
                                      // Text(
                                      //     'Alamat : ${listPanen[index].alamat}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Usia Tanam : ${listPanen[index].usiaTanam}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Id Petani : ${listPanen[index].idPetani}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Petani : ${listPanen[index].petani}',
                                      //     style: blackFontStyle4),
                                      // Text('Desa : ${listPanen[index].desa}',
                                      //     style: blackFontStyle4),
                                      Text(
                                          '${listPanen[index].kecamatan} - ${listPanen[index].kabupaten}',
                                          style: greyFontStyleSmall),
                                      // Text(
                                      //     'Kabupaten : ${listPanen[index].kabupaten}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Provinsi : ${listPanen[index].provinsi}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Latitude : ${listPanen[index].latitude}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Longitude : ${listPanen[index].longitude}',
                                      //     style: blackFontStyle4),
                                      // Text(
                                      //     'Keterangan : ${listPanen[index].keterangan}',
                                      //     style: blackFontStyle4),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     await context
                                  //         .bloc<DeletePanenCubit>()
                                  //         .deleteLahan(listPanen[index].id);
                                  //   },
                                  //   child: Icon(Icons.delete_outline,
                                  //       color: mainColor),
                                  // ),
                                ],
                              ),
                            ),
                          )),
                    ),
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
