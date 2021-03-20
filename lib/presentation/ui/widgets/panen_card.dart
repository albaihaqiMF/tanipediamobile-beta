part of 'widgets.dart';

class PanenCard extends StatelessWidget {
  final Panen panen;
  PanenCard(this.panen);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(bottom: 10),
      child: BasicCard(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                    image: NetworkImage(
                        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/04/15/1911549200.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('${panen.varietas} ${panen.kategori}',
                    //     style: blackFontBoldStyle4),
                    Text((panen.kategori!=null)?
                    '${panen.kategori}' : 'Panen', style: blackFontBoldStyle4),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text('Hasil Panen : ', style: blackFontStyle3,),
                            Text((panen.totalPanen!=null)?
                            '${panen.totalPanen} Kg': '- Kg',
                              style: mainFontBoldStyle3, overflow: TextOverflow.ellipsis, maxLines: 2,),
                          ],
                        ),
                      ],
                    ),
                    // Text('${panen.kabupaten} - ${panen.kecamatan}',
                    //     style: greyFontStyleSmall),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
