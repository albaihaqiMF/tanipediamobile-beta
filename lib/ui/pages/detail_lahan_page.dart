part of 'pages.dart';

class DetailLahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetDetailLahanState state = context.watch<GetDetailLahanCubit>().state;
    return Scaffold(
        appBar: AppBar(title: Text('Detail Lahan')),
        body: Scaffold(
          body: (state is GetDetailLahanLoaded)
              ? Center(
                  child: Column(
                    children: [
                      Text('Kategori : ${state.lahan.kategori}',
                          style: blackFontBoldStyle3),
                      Text('Luas : ${state.lahan.luas}',
                          style: blackFontStyle4),
                      Text('Keterangan : ${state.lahan.keterangan}',
                          style: blackFontStyle4),
                      Text('Alamat : ${state.lahan.alamat}',
                          style: blackFontStyle4),
                      Text('Usia Tanam : ${state.lahan.usiaTanam}',
                          style: blackFontStyle4),
                      Text('Satuan : ${state.lahan.satuan}',
                          style: blackFontStyle4),
                      Text('Petani : ${state.lahan.idPetani}',
                          style: blackFontStyle4),
                      Text('Desa : ${state.lahan.desa}',
                          style: blackFontStyle4),
                      Text('Kecamatan : ${state.lahan.kecamatan}',
                          style: blackFontStyle4),
                      Text('Kabupaten : ${state.lahan.kabupaten}',
                          style: blackFontStyle4),
                      Text('Provinsi : ${state.lahan.provinsi}',
                          style: blackFontStyle4),
                      Text('Latitude : ${state.lahan.latitude}',
                          style: blackFontStyle4),
                      Text('Longitude : ${state.lahan.longitude}',
                          style: blackFontStyle4),
                    ],
                  ),
                )
              : loadingIndicator,
        ));
  }
}
