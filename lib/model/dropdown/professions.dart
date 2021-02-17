part of 'dropdowns.dart';

class Professions {
  String name;
  String code;

  Professions(this.name, this.code);
  static List<Professions> items = [
    Professions('Petani', '1000601'),
    Professions('Buruh', '1000602'),
    Professions('ASN', '1000603'),
    Professions('Pedagang', '1000604'),
    Professions('Penyuluh', '1000605'),
    Professions('Dosen', '1000606'),
    Professions('Pegawai Swasta', '1000607'),
    Professions('Honorer', '1000608'),
  ];

  static List<DropdownMenuItem> generatedItem(List<Professions> listItem) {
    List<DropdownMenuItem> items = [];
    for (var item in listItem) {
      items.add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return items;
  }
}
