part of 'local_services.dart';

abstract class ProfileLocalServicesContract {
  Future<ApiReturnValue<Profile>> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(Profile triviaToCache);
}

const CACHED_PROFILE = 'CACHED_NUMBER_TRIVIA';
class ProfileLocalServices implements ProfileLocalServicesContract {
  final SharedPreferences sharedPreferences;
  ProfileLocalServices({@required this.sharedPreferences});

  @override
  Future<ApiReturnValue<Profile>> getLastNumberTrivia() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(CACHED_PROFILE);
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
  Future<void> cacheNumberTrivia(Profile profileToCache) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      CACHED_PROFILE,
      json.encode(profileToCache.toJson()),
    );
  }
}
