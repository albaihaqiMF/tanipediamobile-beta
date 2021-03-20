part of '../pages.dart';

class ListPanenPage extends StatefulWidget {
  @override
  _ListPanenPageState createState() => _ListPanenPageState();
}

class _ListPanenPageState extends State<ListPanenPage> {
  setUpdateFalse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(KeySharedPreference.updatePanen, false);
  }

  String apiToken;
  getListPanen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      apiToken = prefs.getString(KeySharedPreference.apiToken);
      context.read<GetListPanenCubit>().toInitial();
      context.read<GetListPanenCubit>().getListPanen(apiToken);
    });
  }

  @override
  void initState() {
    super.initState();
    getListPanen();
  }

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {
          setUpdateFalse();
          Get.toNamed(AppRoutes.CREATE_PANEN);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<GetListPanenCubit, GetPanenState>(builder: (_, state) {
        if (state is GetListPanenLoaded) {
          List<Panen> listPanen = state.panen.toList();
          if (listPanen.length != 0) {
            return RefreshIndicator(
              onRefresh: () =>
                  context.read<GetListPanenCubit>().getListPanen(apiToken),
              child: ListView.builder(
                  itemCount: listPanen.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.read<GetDetailPanenCubit>().toInitial();
                        context
                            .read<GetDetailPanenCubit>()
                            .getDetailPanen(apiToken, listPanen[index].id);
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image(
                                            image: NetworkImage(
                                                'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/04/15/1911549200.jpg'),
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
                                        Text((listPanen[index].kategori!=null)?
                                            '${listPanen[index].kategori}':'Panen',
                                            style: blackFontStyle4),
                                        Text((listPanen[index].totalPanen!=null)?
                                            '${listPanen[index].totalPanen} Kg':'- Kg',
                                            style: blackFontBoldStyle4),
                                        // Text(
                                        //     '${listPanen[index].kecamatan} - ${listPanen[index].kabupaten}',
                                        //     style: greyFontStyleSmall),
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
                  }),
            );
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
            child: loadingIndicatorAnim,
          );
        }
      }),
    );
  }
}
