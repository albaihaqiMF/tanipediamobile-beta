part of 'widgets.dart';

class LahanCard extends StatelessWidget {
  final Lahan lahan;
  LahanCard(this.lahan);

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
                        'https://cdn.sinarharapan.co/foto/2018/10/25/91-lahan_persawahan-800x450.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text((lahan.kategori!=null)?'${lahan.kategori}':'Tidak ada kategori', style: blackFontBoldStyle4),
                  Row(
                    children: [
                      Text('Luas lahan : ', style:blackFontStyle3),
                      Text((lahan.luas!=null)?'${lahan.luas} m3':' - m3',
                          style: mainFontBoldStyle3),
                    ],
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
