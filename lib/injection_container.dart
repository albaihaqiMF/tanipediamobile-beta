import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
import 'package:tanipedia_mobile_app/data/repository/profile/profile_contract.dart';

import 'data/data_source/local/local_services.dart';
import 'data/data_source/remote/remote_services.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Cubit
  sl.registerFactory(() => GetProfileCubit(repository: sl()));
  sl.registerFactory(() => UploadPhotoProfileCubit(repository: sl()));
  sl.registerFactory(() => CreateProfileCubit(repository: sl()));
  sl.registerFactory(() => UpdateProfileCubit(repository: sl()));


  // Repository
  sl.registerLazySingleton<ProfileRepositoryContract>(
    () => ProfileRepository(
      networkDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProfileServicesContract>(
    () => ProfileServices(client: sl()),
  );
  sl.registerLazySingleton<ProfileLocalServicesContract>(
    () => ProfileLocalServices(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
