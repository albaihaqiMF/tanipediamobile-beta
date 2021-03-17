part of '../pages.dart';

class ListPupukPage extends StatefulWidget {
  @override
  _ListPupukPageState createState() => _ListPupukPageState();
}

class _ListPupukPageState extends State<ListPupukPage> {
  String apiToken;
  getListPupuk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      apiToken = prefs.getString(KeySharedPreference.apiToken);
      context.read<GetListPupukCubit>().toInitial();
      context.read<GetListPupukCubit>().getListPupuk(apiToken);
    });
  }

  @override
  void initState() {
    super.initState();
    getListPupuk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Distribusi Pupuk', style: mainFontBoldStyle1),
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
      body: BlocBuilder<GetListPupukCubit, GetListPupukState>(
        builder: (_, state) {
          if (state is GetListPupukLoaded) {
            List<Pupuk> listPupuk = state.pupuk.toList();
            if (listPupuk.length != 0) {
              return ListView.builder(
                itemCount: listPupuk.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<DetailPupukCubit>()
                          .getDetailPupuk(apiToken, listPupuk[index].id);
                      Get.toNamed(AppRoutes.DETAIL_PUPUK);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text((listPupuk[index].poktan!=null)?
                                    listPupuk[index].poktan:'Poktan',
                                    style: mainFontBoldStyle2),
                              ),
                              Divider(color: Colors.black),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          buildBorder(
                                            Icon(Icons.event_outlined,
                                                color: mainColor, size: 16),
                                          ),
                                          Text(
                                            'Tanggal Distribusi',
                                            style: greyFontStyle,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          buildBorder(
                                            Icon(Icons.shopping_basket_outlined,
                                                color: mainColor, size: 16),
                                          ),
                                          Text(
                                            'Kapasitas',
                                            style: greyFontStyle,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          buildBorder(
                                            Icon(
                                                (listPupuk[index]
                                                            .tglDistribusi ==
                                                        "Belum diambil")
                                                    ? Icons.check
                                                    : Icons.close,
                                                color: mainColor,
                                                size: 16),
                                          ),
                                          Text(
                                            'Status',
                                            style: greyFontStyle,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          buildBorder(
                                            Icon(Icons.domain,
                                                color: mainColor, size: 16),
                                          ),
                                          Text(
                                            'Instansi',
                                            style: greyFontStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text((listPupuk[index].tglDistribusi!=null)?
                                        '${listPupuk[index].tglDistribusi}':'-',
                                        style: blackFontStyle4,
                                      ),
                                      SizedBox(height: 10),
                                      Text((listPupuk[index].kapasitas!=null)?
                                        '${listPupuk[index].kapasitas}':'-',
                                        style: blackFontStyle4,
                                      ),
                                      SizedBox(height: 10),
                                      Text((listPupuk[index].keterangan!=null)?
                                        '${listPupuk[index].keterangan}':'-',
                                        style: blackFontStyle4,
                                      ),
                                      SizedBox(height: 10),
                                      Text((listPupuk[index].instansi!=null)?
                                        '${listPupuk[index].instansi}':'-',
                                        style: blackFontStyle4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Oops belum ada jadwal pembagian pupuk..'),
              );
            }
          } else if (state is GetListPupukFailed) {
            return (Center(
              child: Text('List Pupuk gagal di muat...'),
            ));
          } else {
            return Center(
              child: loadingIndicatorAnim,
            );
          }
        },
      ),
    );
  }

  Widget buildBorder(Widget child) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
        side: BorderSide(
          color: mainColor,
          width: 1.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}
