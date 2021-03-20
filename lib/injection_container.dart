import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/cubit.dart';

import 'data/data_source/local/local_services.dart';
import 'data/data_source/remote/remote_services.dart';
import 'core/network/network_info.dart';
import 'data/data_source/remote/remote_services_contract.dart';
import 'data/repository/repositories.dart';
import 'data/repository/repositories_contract.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //--------------------------------------------------------------------
  //                          PRESENTATION
  //--------------------------------------------------------------------

  //------------------
  // Cubit
  //------------------
  // User
  sl.registerFactory(() => VerifyUserCubit(repository: sl()));
  sl.registerFactory(() => LoginCubit(repository: sl()));
  sl.registerFactory(() => UpdateUserCubit(repository: sl()));
  sl.registerFactory(() => RegisterCubit(repository: sl()));
  // Profile
  sl.registerFactory(() => GetProfileCubit(repository: sl()));
  sl.registerFactory(() => UploadPhotoProfileCubit(repository: sl()));
  sl.registerFactory(() => CreateProfileCubit(repository: sl()));
  sl.registerFactory(() => UpdateProfileCubit(repository: sl()));

  // Pupuk
  sl.registerFactory(() => GetListPupukCubit(repository: sl()));
  sl.registerFactory(() => DetailPupukCubit(repository: sl()));

  // Panen
  sl.registerFactory(() => GetListPanenCubit(repository: sl()));
  sl.registerFactory(() => GetDetailPanenCubit(repository: sl()));
  sl.registerFactory(() => CreatePanenCubit(repository: sl()));
  sl.registerFactory(() => DeletePanenCubit(repository: sl()));
  sl.registerFactory(() => UpdatePanenCubit(repository: sl()));

  // Lahan
  sl.registerFactory(() => GetListLahanCubit(repository: sl()));
  sl.registerFactory(() => GetDetailLahanCubit(repository: sl()));
  sl.registerFactory(() => CreateLahanCubit(repository: sl()));
  sl.registerFactory(() => DeleteLahanCubit(repository: sl()));
  sl.registerFactory(() => UpdateLahanCubit(repository: sl()));

  // Wilayah
  sl.registerFactory(() => ProvinsiCubit(repository: sl()));
  sl.registerFactory(() => KabupatenCubit(repository: sl()));
  sl.registerFactory(() => KecamatanCubit(repository: sl()));
  sl.registerFactory(() => DesaCubit(repository: sl()));

  //--------------------------------------------------------------------
  //                            DATA
  //--------------------------------------------------------------------
  //------------------
  // Repository
  //------------------
  sl.registerLazySingleton<ProfileRepositoryContract>(
    () => ProfileRepository(
      networkDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PupukRepositoryContract>(
        () => PupukRepository(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PanenRepositoryContract>(
        () => PanenRepository(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<LahanRepositoryContract>(
        () => LahanRepository(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<WilayahRepositoryContract>(
        () => WilayahRepository(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepositoryContract>(
        () => UserRepository(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //------------------
  // Data sources
  //------------------
  // Remote
  sl.registerLazySingleton<UserServicesContract>(
        () => UserServices(client: sl()),
  );
  sl.registerLazySingleton<ProfileServicesContract>(
    () => ProfileServices(client: sl()),
  );
  sl.registerLazySingleton<PupukServicesContract>(
        () => PupukServices(client: sl()),
  );
  sl.registerLazySingleton<PanenServicesContract>(
        () => PanenServices(client: sl()),
  );
  sl.registerLazySingleton<LahanServicesContract>(
        () => LahanServices(client: sl()),
  );
  sl.registerLazySingleton<WilayahServicesContract>(
        () => WilayahServices(client: sl()),
  );
  // Local
  sl.registerLazySingleton<ProfileLocalServicesContract>(
    () => ProfileLocalServices(sharedPreferences: sl()),
  );

  //--------------------------------------------------------------------
  //                          CORE
  //--------------------------------------------------------------------
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //--------------------------------------------------------------------
  //                        EXTERNAL
  //--------------------------------------------------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
