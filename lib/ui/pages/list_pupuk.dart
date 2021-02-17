part of 'pages.dart';

class ListPupukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<GetListPupukCubit, GetListPupukState>(builder: (_, state) {
      if (state is GetListPupukLoaded) {
        List<Pupuk> listPupuk = state.pupuk.toList();

        if (listPupuk.length != 0) {
          // return listPupuk.map((e) => null)
          return ListView.builder(
              itemCount: listPupuk.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(60 / 2),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listPupuk[index].jenis,
                                  style: blackFontBoldStyle3),
                              Text('Kapasitas : ${listPupuk[index].kapasitas}',
                                  style: blackFontStyle4),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: Text('Oops belum ada jadwal pembagian pupuk..'),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    }));
  }

  Widget buildCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(60 / 2),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pupuk Urea', style: blackFontBoldStyle3),
                  Text('Pupuk Kandang', style: blackFontStyle4)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
