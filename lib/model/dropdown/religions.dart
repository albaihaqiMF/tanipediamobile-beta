part of 'dropdowns.dart';

class Religions {
  String name;
  String code;

  Religions(this.name, this.code);

  static List<Religions> items = [
    Religions('Islam', '1000201'),
    Religions('Kristen', '1000202'),
    Religions('Katolik', '1000203'),
    Religions('Hindu', '1000204'),
    Religions('Budha', '1000205'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Religions> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
