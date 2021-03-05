part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String apiToken;
  Map<String, String>
  queryParam = {
    'order_by':'id',
    'sort':'DESC',
    'page': '1',
    'limit_page': '3',
  };

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      apiToken = prefs.getString(KeySharedPreference.apiToken);
      context.read<GetListPupukCubit>().getListPupukFiltered(apiToken,queryParam);
      context.read<GetPanenCubit>().getListPanenFiltered(apiToken, queryParam);
      context.read<GetListLahanCubit>().getListLahanFiltered(apiToken,queryParam);
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    final data = (context.watch<ProfileCubit>().state as ProfileLoaded);
    String username = data.profile.nama;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: mainColor,
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image(
                            image: AssetImage('assets/bg_dashboard.png'))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Halo', style: whiteFontBoldStyle2),
                        Container(
                          width: 200,
                          child: Text(
                            '$username',
                            maxLines: 1,
                            style: blackFontBoldStyle0.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('"Selamat datang di Tanipedia"',
                            style: greyFontStyleSmall.copyWith(
                                color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga Pasar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: mainColor)),
                    InkWell(
                      child:
                          Text('Lainnya', style: TextStyle(color: mainColor)),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => CommingSoonDialog());
                      },
                    )
                  ],
                ),
              ),
              buildHargaPasar(),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Distribusi Pupuk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: mainColor)),
                    InkWell(
                        child:
                            Text('Lainnya', style: TextStyle(color: mainColor)),
                        onTap: () {
                          Get.toNamed(AppRoutes.PUPUK);
                        })
                  ],
                ),
              ),
              buildDistribusiPupuk(),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hasil Panen',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: mainColor)),
                    InkWell(
                      child:
                          Text('Lainnya', style: TextStyle(color: mainColor)),
                      onTap: () {
                        Get.toNamed(AppRoutes.PANEN);
                      },
                    )
                  ],
                ),
              ),
              buildPanen(),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Daftar Lahan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: mainColor)),
                    InkWell(
                      child:
                      Text('Lainnya', style: TextStyle(color: mainColor)),
                      onTap: () {
                        Get.toNamed(AppRoutes.LAHAN);
                      },
                    )
                  ],
                ),
              ),
              buildLahan(),
            ],
          ),
        ),
      ),
    );
  }

  buildHargaPasar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          BasicCard(
            // ListView.builder(
            //     itemCount: 2,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         child: Row(children: []),
            //       );
            //     }),
            // Spacer(),

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                  image: AssetImage('assets/ic_kentang.png'))),
                          SizedBox(width: 10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kentang'),
                                SizedBox(height: 3),
                                Text('4 Februari 2021',
                                    style: greyFontStyleSmall)
                              ]),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('140.000/Kg'),
                            SizedBox(height: 3),
                            Text('+14.000(10%)',
                                style: greyFontStyleSmall.copyWith(
                                    color: mainColor))
                          ]),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                  image: AssetImage('assets/ic_cokelat.png'))),
                          SizedBox(width: 10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cokelat'),
                                SizedBox(height: 3),
                                Text('4 Februari 2021',
                                    style: greyFontStyleSmall)
                              ]),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('140.000/Kg'),
                            SizedBox(height: 3),
                            Text('-14.000(10%)',
                                style: greyFontStyleSmall.copyWith(
                                    color: Colors.red))
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildDistribusiPupuk() {
    return Container(
      height: 120,
      width: double.infinity,
      child: BlocBuilder<GetListPupukCubit, GetListPupukState>(
        builder: (_, state) => (state is GetListPupukLoaded)
            ? (state.pupuk.length == 0)
                ? Center(child: Text('Pupuk'))
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: state.pupuk
                            .map((e) => Padding(
                                  padding: EdgeInsets.only(
                                      left: (e == state.pupuk.first)
                                          ? defaultMargin
                                          : 0,
                                      right: defaultMargin),
                                  child: PupukCard(e),
                                ))
                            .toList(),
                      )
                    ],
                  )
            : Center(child: loadingIndicator),
      ),
    );
  }

  buildPanen() {
    return Container(
      height: 120,
      width: double.infinity,
      child: BlocBuilder<GetPanenCubit, GetPanenState>(
        builder: (_, state) => (state is GetListPanenLoaded)
            ? (state.panen.length == 0)
                ? Center(child: Text('Panen'))
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: state.panen
                            .map((e) => Padding(
                                  padding: EdgeInsets.only(
                                      left: (e == state.panen.first)
                                          ? defaultMargin
                                          : 0,
                                      right: defaultMargin),
                                  child: PanenCard(e),
                                ))
                            .toList(),
                      )
                    ],
                  )
            : Center(child: loadingIndicator),
      ),
    );
  }


  buildLahan() {
    return Container(
      height: 120,
      width: double.infinity,
      child: BlocBuilder<GetListLahanCubit, GetListLahanState>(
        builder: (_, state) => (state is GetListLahanLoaded)
            ? (state.lahan.length == 0)
            ? Center(child: Text('Panen'))
            : ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: state.lahan
                  .map((e) => Padding(
                padding: EdgeInsets.only(
                    left: (e == state.lahan.first)
                        ? defaultMargin
                        : 0,
                    right: defaultMargin),
                child: LahanCard(e),
              ))
                  .toList(),
            )
          ],
        )
            : Center(child: loadingIndicator),
      ),
    );
  }
}
