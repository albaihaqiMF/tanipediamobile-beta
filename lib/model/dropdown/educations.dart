part of 'dropdowns.dart';

class Educations {
  String name;
  String code;
  Educations(this.name, this.code);

  static List<Educations> items = [
    Educations('Tidak Sekolah', '1000301'),
    Educations('SD', '1000302'),
    Educations('SMP', '1000303'),
    Educations('SMA', '1000304'),
    Educations('S1', '1000305'),
    Educations('S2', '1000306'),
    Educations('S3', '1000307'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Educations> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
