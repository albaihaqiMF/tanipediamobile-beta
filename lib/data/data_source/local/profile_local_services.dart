part of 'local_services.dart';

abstract class ProfileLocalServices {
  Future<ApiReturnValue<Profile>> getDataProfile();
  Future<void> cacheDataProfile(Profile triviaToCache);
}

class ProfileLocalServicesImpl implements ProfileLocalServices {
  final SharedPreferences sharedPreferences;
  ProfileLocalServicesImpl({@required this.sharedPreferences});

  @override
  Future<ApiReturnValue<Profile>> getDataProfile() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(KeySharedPreference.CACHED_PROFILE);
    if (jsonString != null) {
      print('CACHED JSON : $jsonString');
      final dataProfile = Profile.fromJSON(json.decode(jsonString));
      return ApiReturnValue(value: dataProfile);
    } else {
      print('CACHED FAILED : $jsonString');
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
}
