part of 'dao.dart';

class ProfileDao {
  static const tag = 'PROFILE_DAO';

  // Entity
  static final tableProfile = 'profile';
  static final columnIdProfile = 'id';
  static final columnIdProfileAPI = 'id_profile';
  static final columnName = 'name';

  Future<int> insert(Profile profile) async {
    Database db = await DatabaseHelper.instance.database;
    // Cause Profile just 1 data so delete previous data to keep 1 data
    // db.execute('DELETE * FROM ${Entity.tableProfile}');
    print('$tag : data = ${profile.toMap()}');
    return await db.insert(
      tableProfile, profile.toMap(),
      // to use in case the same data is inserted twice.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Profile>> select() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> data = await db.query(tableProfile);
    return List.generate(data.length, (i) {
      return Profile(
        id: data[0]['id_profile'],
        nama: data[0]['name'],
      );
    });
  }

  Future<List<Profile>> selectAll() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> data = await db.query(tableProfile);
    return List.generate(data.length, (i) {
      return Profile(
        id: data[i]['id_profile'],
        nama: data[i]['name'],
      );
    });
  }

  Future<Profile> selectById(int id) async {
    Database db = await DatabaseHelper.instance.database;
    var data = await db.query(tableProfile,
        where: '$columnIdProfile = ?', whereArgs: [id]);
    return Profile(
      id: data[id]['id_profile'],
      nama: data[id]['name'],
    );
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(tableProfile,
        where: '$columnIdProfile = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(tableProfile);
  }

  Future<int> update(String id, String nama, int idProfile) async {
    Database db = await DatabaseHelper.instance.database;
    db.execute(
        'UPDATE $tableProfile SET $columnName=?, $columnIdProfileAPI=? where $columnIdProfile=?',
        [nama, idProfile, id]);
    int count = 1;
    return count;
  }
}
