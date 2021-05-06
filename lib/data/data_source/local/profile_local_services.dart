part of 'local_services.dart';

abstract class ProfileLocalServices {
  Future<ApiReturnValue<Profile>> getDataProfile();
  Future<void> cacheDataProfile(Profile triviaToCache);
  Future<void> cacheSQLite(Profile data);
  Future<ApiReturnValue<Profile>> getFromSQLite();
}

class ProfileLocalServicesImpl implements ProfileLocalServices {
  static const tag = 'PROFILE_LOCAL_SERVICES';
  final SharedPreferences sharedPreferences;
  ProfileLocalServicesImpl({@required this.sharedPreferences});

  @override
  Future<ApiReturnValue<Profile>> getDataProfile() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(KeySharedPreference.CACHED_PROFILE);
    if (jsonString != null) {
      print('$tag, CACHED JSON = $jsonString');
      final dataProfile = Profile.fromJSON(json.decode(jsonString));
      return ApiReturnValue(value: dataProfile);
    } else {
      print('$tag, CACHED FAILED = $jsonString');
      return null;
    }
  }

  @override
  Future<void> cacheDataProfile(Profile profileToCache) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      KeySharedPreference.CACHED_PROFILE,
      json.encode(profileToCache.toJson()),
    );
  }

  @override
  Future<void> cacheSQLite(Profile data) async {
    ProfileDao profileDao = sl<ProfileDao>();
    print('$tag : Data Id : ${data.id}');
    print('$tag : Data Name : ${data.nama}');
    return profileDao.insert(data);
  }

  @override
  Future<ApiReturnValue<Profile>> getFromSQLite() async {
    ProfileDao dao = sl<ProfileDao>();
    List<Profile> dataList;
    await dao.select().then((value) {
      try {
        dataList = value;
        print('SUCCESS get Data : $dataList');
      } on RangeError {
        print('EMPTY DATABASE');
        throw EmptyDatabase();
      }
      // if(value.isNotEmpty) {
      //   jsonString = value;
      // } else {
      // }
    });

    if (dataList.isNotEmpty) {
      return ApiReturnValue(value: dataList[0]);
    } else {
      print('$tag : CACHED FAILED, $dataList');
      throw EmptyDatabase();
    }
  }


}
