part of 'dropdowns.dart';

class Desa {
  String name;
  String code;
  Desa(this.name, this.code);

  static List<Desa> items = [
    Desa('Ambarawa', '11'),
    Desa('Kalirejo', '12'),
    Desa('Kedaton', '13'),
    Desa('Rajabasa', '14'),
    Desa('Pujodadi', '15'),
    Desa('Pagelaran', '16')
  ];

  static List<DropdownMenuItem> generatedItem(List<Desa> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
