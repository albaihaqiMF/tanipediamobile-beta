part of '../pages.dart';

class DetailPupukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailPupukState state = context.watch<DetailPupukCubit>().state;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Detail Distribusi Pupuk', style: mainFontBoldStyle1),
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
      body: (state is DetailPupukLoaded)
          ? SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(defaultMargin),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: WrapBorder(
                          Center(
                            child: Text((state.pupuk.poktan!=null)?
                                state.pupuk.poktan:'Tidak ada data poktan',
                                style: mainFontBoldStyle3),
                          ),
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  WrapBorderCircle(
                                    child: Icon(Icons.date_range_outlined,
                                        color: mainColor, size: 16),
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Tanggal Distribusi',
                                    style: greyFontStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(children: [
                            Text((state.pupuk.tglDistribusi!=null)?
                              '${state.pupuk.tglDistribusi}':'-',
                              style: blackFontStyle4,
                            )
                          ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  WrapBorderCircle(
                                    color: Colors.white,
                                    child: Icon(Icons.shopping_basket_outlined,
                                        color: mainColor, size: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Kapasitas', style: greyFontStyle),
                                ],
                              ),
                            ],
                          ),
                          Column(children: [
                            Text((state.pupuk.kapasitas!=null)?
                                '${state.pupuk.kapasitas}':'-',
                                style: blackFontStyle4),
                          ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  WrapBorderCircle(
                                    child: Icon(
                                        Icons.indeterminate_check_box_outlined,
                                        color: Colors.red,
                                        size: 16),
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Status', style: greyFontStyle),
                                ],
                              ),
                            ],
                          ),
                          Column(children: [
                            Text((state.pupuk.keterangan!=null)?
                                '${state.pupuk.keterangan}':'-',
                                style: blackFontStyle4),
                          ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  WrapBorderCircle(
                                    child: Icon(Icons.domain_outlined,
                                        color: mainColor, size: 16),
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Institusi', style: greyFontStyle),
                                ],
                              )
                            ],
                          ),
                          Column(children: [
                            Text((state.pupuk.instansi!=null)?
                                '${state.pupuk.instansi}':'-',
                                style: blackFontStyle4),
                          ]),
                        ],
                      ),
                    ],
                  ),
                )),
          )
          : Center(child:loadingIndicatorAnim),
    );
  }
}
