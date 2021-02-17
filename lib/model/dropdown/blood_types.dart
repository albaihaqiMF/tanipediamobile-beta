part of 'dropdowns.dart';

class BloodTypes {
  String name;
  String code;

  BloodTypes(this.name, this.code);

  static List<BloodTypes> items = [
    BloodTypes('A', '1000401'),
    BloodTypes('B', '1000402'),
    BloodTypes('AB', '1000403'),
    BloodTypes('O', '1000404'),
  ];

  static List<DropdownMenuItem> generatedItem(List<BloodTypes> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
