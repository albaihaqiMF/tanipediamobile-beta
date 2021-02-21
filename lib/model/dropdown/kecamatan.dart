part of 'dropdowns.dart';

class Kecamatan {
  String name;
  String code;
  Kecamatan(this.name, this.code);

  static List<Kecamatan> items = [
    Kecamatan('Ambarawa', '21'),
    Kecamatan('Pringsewu', '22'),
    Kecamatan('Pagelaran', '23'),
    Kecamatan('Rajabasa', '24'),
    Kecamatan('Kedaton', '25'),
    Kecamatan('Labuhan Ratu', '26')
  ];

  static List<DropdownMenuItem> generatedItem(List<Kecamatan> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
