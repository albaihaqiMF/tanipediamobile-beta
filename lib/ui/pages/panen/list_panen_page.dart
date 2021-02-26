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
                      Get.toNamed(AppRoutes.DETAIL_PANEN);
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
                                          image: NetworkImage(
                                              'http://bulelengkab.go.id/assets/instansikab/71/artikel/waspada-serangan-hama-padi-di-musim-hujan-mengintai-16.jpg'),
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
                                          '${listPanen[index].varietas} ${listPanen[index].kategori}',
                                          style: blackFontStyle4),
                                      Text('${listPanen[index].satuan} Kwintal',
                                          style: blackFontBoldStyle4),
                                      Text(
                                          '${listPanen[index].kecamatan} - ${listPanen[index].kabupaten}',
                                          style: greyFontStyleSmall),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
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
