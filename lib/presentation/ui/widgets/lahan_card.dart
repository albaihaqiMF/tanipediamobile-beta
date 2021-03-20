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
                        'https://cdn.pixabay.com/photo/2020/10/03/11/14/rice-fields-5623251__340.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text((lahan.kategori!=null)?'${lahan.kategori}':'Lahan', style: blackFontBoldStyle4),
                    Row(
                      children: [
                        Text('Luas lahan : ', style:blackFontStyle3),
                        Text((lahan.luas!=null)?'${lahan.luas} m3':' - m3',
                          style: mainFontBoldStyle3, overflow: TextOverflow.ellipsis, maxLines: 2,),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
