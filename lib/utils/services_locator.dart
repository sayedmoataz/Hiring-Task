
import 'package:get_it/get_it.dart';



final sl = GetIt.instance;

init() async {
  //! Feature
  // bloc
  // sl.registerFactory(() {
  //   debugPrint('loginCubit.sl done');
  //   return LoginCubit();
  // });


  // // Use Cases
  // sl.registerLazySingleton(() {
  //   debugPrint('GetChat.sl done');
  //   return GetChat(chattRepository: sl());
  // });
  //
  // // Repository
  // sl.registerLazySingleton<ChatRepository>(() {
  //   debugPrint('ChatRepositoryImpl.sl done');
  //   return ChatRepositoryImpl(
  //     gptResponesRemote: sl(),
  //     networkInfo: sl(),
  //   );
  // });
  //
  // // Data Source
  // sl.registerLazySingleton<ChatRepositoryRemoteDataSource>(() {
  //   debugPrint('ChatRepositoryRemoteDataSourceImpl.sl done');
  //   return ChatRepositoryRemoteDataSourceImpl(client: sl());
  // });
  //
  // //! Core
  // sl.registerLazySingleton<NetworkInfo>(() {
  //   debugPrint('NetworkInfoImpl.sl done');
  //   return NetworkInfoImpl(internetConnectionChecker: sl());
  // });
}