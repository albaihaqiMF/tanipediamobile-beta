part of '../pages.dart';

class ListLahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.watch<GetListLahanCubit>().getListLahan();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Lahan Pertanian', style: mainFontBoldStyle1),
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
        onPressed: () => Get.toNamed(AppRoutes.CREATE_LAHAN),
        child: Icon(Icons.add, color: Colors.white),
      ),
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
                        context.read<GetDetailLahanCubit>().toInitial();
                        context
                            .read<GetDetailLahanCubit>()
                            .getDetailLahan(listLahan[index].id);
                        Get.toNamed(AppRoutes.DETAIL_LAHAN);
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60 / 2),
                                    child: Image(
                                        image: AssetImage(
                                          "assets/ic_sawah.png",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${listLahan[index].kategori}',
                                        style: blackFontBoldStyle4),
                                    Text(
                                        (listLahan[index].kecamatan != null)
                                            ? '${listLahan[index].kecamatan}'
                                            : 'Tidak ada data kecamatan',
                                        style: greyFontStyleSmall),
                                    Text(
                                        (listLahan[index].kabupaten != null)
                                            ? '${listLahan[index].kabupaten}'
                                            : 'Tidak ada data kabupaten',
                                        style: greyFontStyleSmall),
                                  ],
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_rounded)
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
