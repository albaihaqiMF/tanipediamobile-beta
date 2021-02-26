part of 'widgets.dart';

class PupukCard extends StatelessWidget {
  final Pupuk pupuk;
  PupukCard(this.pupuk);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: BasicCard(
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Image(
                image: AssetImage('assets/ic_pupuk.png'),
              ),
            ),
            SizedBox(width: 5),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(pupuk.poktan, style: mainFontBoldStyle2),
              Text('Tanggal Distribusi: ${pupuk.tglDistribusi}',
                  style: greyFontStyleSmall.copyWith(color: Colors.black)),
              Text('Status: ${pupuk.keterangan}',
                  style: greyFontStyleSmall.copyWith(color: Colors.black)),
            ]),
          ],
        ),
      ),
    );
  }
}