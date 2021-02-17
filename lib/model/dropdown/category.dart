part of 'dropdowns.dart';

class Categories {
  String name;
  String code;
  Categories(this.name, this.code);
  static List<Categories> items = [
    Categories('Personal', '1000001'),
    Categories('Institusi', '1000002'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Categories> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
