part of 'pages.dart';

class DetailPupukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailPupukState state = context.watch<DetailPupukCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Distribusi Pupuk'),
        brightness: Brightness.light,
      ),
      body: (state is DetailPupukLoaded)
          ? Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: WrapBorder(
                        Center(
                          child: Text(state.pupuk.poktan,
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
                          Text(
                            '${state.pupuk.tglDistribusi}',
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
                          Text('${state.pupuk.kapasitas}',
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
                          Text('${state.pupuk.keterangan}',
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
                          Text('${state.pupuk.instansi}',
                              style: blackFontStyle4),
                        ]),
                      ],
                    ),

                    // Salah
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Icon(Icons.date_range_outlined, color: mainColor),
                    //             Text('Tanggal Distribusi'),
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Icon(Icons.shopping_basket_outlined,
                    //                 color: mainColor),
                    //             Text('Kapasitas'),
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Icon(Icons.indeterminate_check_box_outlined,
                    //                 color: Colors.red),
                    //             Text('Status'),
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Icon(Icons.domain_outlined, color: mainColor),
                    //             Text('Status'),
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('${state.pupuk.tglDistribusi}'),
                    //         Text('${state.pupuk.kapasitas}'),
                    //         Text('${state.pupuk.keterangan}'),
                    //         Text('${state.pupuk.instansi}'),
                    //       ],
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ))
          : loadingIndicator,
    );
  }
}
