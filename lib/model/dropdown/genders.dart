part of 'dropdowns.dart';

class Genders {
  String name;
  String code;
  Genders(this.name, this.code);

  static List<Genders> items = [
    Genders('Laki-laki', '1000101'),
    Genders('Perempuan', '1000102'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Genders> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
