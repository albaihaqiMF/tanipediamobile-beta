part of 'dropdowns.dart';

class Ethnics {
  String name;
  String code;
  Ethnics(this.name, this.code);

  static List<Ethnics> items = [
    Ethnics('Jawa', '1000501'),
    Ethnics('Sunda', '1000502'),
    Ethnics('Lampung', '1000503'),
    Ethnics('Bugis', '1000504'),
    Ethnics('Palembang', '1000505'),
    Ethnics('Padang', '1000506'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Ethnics> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
