part of 'dropdowns.dart';

class Kabupaten {
  String name;
  String code;
  Kabupaten(this.name, this.code);

  static List<Kabupaten> items = [
    Kabupaten('Ambarawa', '21'),
    Kabupaten('Pringsewu', '22'),
    Kabupaten('Pagelaran', '23'),
    Kabupaten('Rajabasa', '24'),
    Kabupaten('Kedaton', '25'),
    Kabupaten('Labuhan Ratu', '26')
  ];

  static List<DropdownMenuItem> generatedItem(List<Kabupaten> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
