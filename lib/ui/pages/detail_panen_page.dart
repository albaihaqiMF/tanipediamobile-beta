part of 'pages.dart';

class DetailPanenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetDetailPanenCubit, GetDetailPanenState>(
          builder: (_, state) {
        if (state is GetDetailPanenLoaded) {
          // GetDetailPanenCubit cubit = context.watch<GetDetailLahanCubit>(context);
          // GetDetailPanenCubit loginBloc = BlocProvider.of<GetDetailPanenCubit>(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kategori : ${state.panen.kategori}',
                    style: blackFontBoldStyle3),
                Text('Luas : ${state.panen.luas}', style: blackFontStyle4),
                Text('Keterangan : ${state.panen.keterangan}',
                    style: blackFontStyle4),
                Text('Alamat : ${state.panen.alamat}', style: blackFontStyle4),
                Text('Usia Tanam : ${state.panen.usiaTanam}',
                    style: blackFontStyle4),
                Text('Satuan : ${state.panen.satuan}', style: blackFontStyle4),
                Text('Petani : ${state.panen.idPetani}',
                    style: blackFontStyle4),
                Text('Desa : ${state.panen.desa}', style: blackFontStyle4),
                Text('Kecamatan : ${state.panen.kecamatan}',
                    style: blackFontStyle4),
                Text('Kabupaten : ${state.panen.kabupaten}',
                    style: blackFontStyle4),
                Text('Provinsi : ${state.panen.provinsi}',
                    style: blackFontStyle4),
                Text('Latitude : ${state.panen.latitude}',
                    style: blackFontStyle4),
                Text('Longitude : ${state.panen.longitude}',
                    style: blackFontStyle4),
              ],
            ),
          );
        } else if (state is GetDetailPanenFailed) {
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
