import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:you_app_task/core/api/auth/auth_api_provider.dart';
import 'package:you_app_task/core/api/auth/i_auth_api_provider.dart';
import 'package:you_app_task/core/api/environment.dart';
import 'package:you_app_task/core/api/profile/i_profile_api_provider.dart';
import 'package:you_app_task/core/api/profile/profile_api_provider.dart';
import 'package:you_app_task/core/mapper/profile_mapper.dart';
import 'package:you_app_task/core/network/dio_network_client.dart';
import 'package:you_app_task/core/network/i_network_client.dart';
import 'package:you_app_task/core/repository/auth_repository.dart';
import 'package:you_app_task/core/repository/i_auth_repository.dart';
import 'package:you_app_task/core/repository/i_profile_repository.dart';
import 'package:you_app_task/core/repository/profile_repository.dart';

final sl = GetIt.instance;

Future<void> registerServiceLocator(Environment env) async {
  registerNetworkClients(env);
  registerApis();
  registerRepositories();
  registerMappers();
}

void registerNetworkClients(Environment env) {
  sl.registerLazySingleton<INetworkClient>(() {
    var client = DioNetworkClient(options: BaseOptions(baseUrl: env.youAppUrl));
    return client;
  }, instanceName: 'yourApp');
}

void registerApis() {
  sl.registerLazySingleton<IProfileApiProvider>(() {
    return ProfileApiProvider(sl.get(instanceName: 'yourApp'));
  });

  sl.registerLazySingleton<IAuthApiProvider>(() {
    return AuthApiProvider(sl.get(instanceName: 'yourApp'));
  });
}

void registerRepositories() {
  sl.registerLazySingleton<IProfileRepository>(() {
    return ProfileRepository(sl.get(), sl.get());
  });

  sl.registerLazySingleton<IAuthRepository>(() {
    return AuthRepository(sl.get());
  });
}

void registerMappers() {
  sl.registerLazySingleton<ProfileMapper>(() => ProfileMapper());
}
