part of 'dropdowns.dart';

class Provinsi {
  String name;
  String code;
  Provinsi(this.name, this.code);

  static List<Provinsi> items = [
    Provinsi('Lampung', '331'),
    Provinsi('Palembang', '332'),
    Provinsi('Jakarta', '333'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Provinsi> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
