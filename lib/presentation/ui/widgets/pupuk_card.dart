part of 'widgets.dart';

class PupukCard extends StatelessWidget {
  final Pupuk pupuk;
  PupukCard(this.pupuk);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
            Flexible(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text((pupuk.poktan!=null)?pupuk.poktan:'Poktan', style: mainFontBoldStyle2),
                Text((pupuk.tglDistribusi!=null)?'Tanggal Distribusi: ${pupuk.tglDistribusi}':'Tanggal Distribusi: -', overflow: TextOverflow.ellipsis,
                    style: greyFontStyleSmall.copyWith(color: Colors.black)),
                Text((pupuk.keterangan!=null)?'Status: ${pupuk.keterangan}':'Status: -',
                  style: greyFontStyleSmall.copyWith(color: Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
