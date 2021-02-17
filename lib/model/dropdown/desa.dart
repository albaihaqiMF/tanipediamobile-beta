part of 'dropdowns.dart';

class Desa {
  String name;
  String kode;
  Desa(this.name, this.kode);

  static List<Desa> items = [
    Desa('Ambarawa', '3'),
    Desa('Kalirejo', '4'),
    Desa('Kedaton', '4'),
    Desa('Rajabasa', '4'),
    Desa('Pujodadi', '4'),
    Desa('Pagelaran', '4')
  ];

  static List<DropdownMenuItem> generatedItem(List<Desa> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
