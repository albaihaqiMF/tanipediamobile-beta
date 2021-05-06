import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/core/local_storage/database/dao/dao.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/cubit.dart';

import 'data/data_source/local/local_services.dart';
import 'data/data_source/remote/remote_services_impl.dart';
import 'core/network/network_info.dart';
import 'data/data_source/remote/remote_services.dart';
import 'data/repository/repositories_impl.dart';
import 'data/repository/repositories.dart';

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
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      networkDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PupukRepository>(
        () => PupukRepositoryImpl(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PanenRepository>(
        () => PanenRepositoryImpl(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<LahanRepository>(
        () => LahanRepositoryImpl(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<WilayahRepository>(
        () => WilayahRepositoryImpl(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
      networkDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //------------------
  // Data sources
  //------------------
  // Remote
  sl.registerLazySingleton<UserServices>(
        () => UserServicesImpl(client: sl()),
  );
  sl.registerLazySingleton<ProfileServices>(
    () => ProfileServicesImpl(client: sl()),
  );
  sl.registerLazySingleton<PupukServices>(
        () => PupukServicesImpl(client: sl()),
  );
  sl.registerLazySingleton<PanenServices>(
        () => PanenServicesImpl(client: sl()),
  );
  sl.registerLazySingleton<LahanServices>(
        () => LahanServicesImpl(client: sl()),
  );
  sl.registerLazySingleton<WilayahServices>(
        () => WilayahServicesImpl(client: sl()),
  );
  // Local
  sl.registerLazySingleton<ProfileLocalServices>(
    () => ProfileLocalServicesImpl(sharedPreferences: sl()),
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

  //------------------
  // SQFlite
  //------------------
  // DAO
  sl.registerSingleton(ProfileDao());
}
