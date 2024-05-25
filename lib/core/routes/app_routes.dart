import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:you_app_task/core/repository/i_auth_repository.dart';
import 'package:you_app_task/core/repository/i_profile_repository.dart';
import 'package:you_app_task/presentation/bloc/auth/auth_cubit.dart';
import 'package:you_app_task/presentation/bloc/profile/profile_bloc.dart';
import 'package:you_app_task/presentation/screens/auth/login_screen.dart';
import 'package:you_app_task/presentation/screens/auth/register_screen.dart';
import 'package:you_app_task/presentation/screens/profile/interests_screen.dart';
import 'package:you_app_task/presentation/screens/profile/profile_screen.dart';

final sl = GetIt.instance;

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings, String tkn) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => AuthCubit(
                sl.get<IAuthRepository>(),
              ),
            )
          ], child: LoginScreen()),
        );

      case '/register':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => AuthCubit(sl.get<IAuthRepository>())),
          ], child: RegisterScreen()),
        );

      case '/profile':
        String token = tkn.isEmpty ? routeSettings.arguments as String : tkn;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => ProfileBloc(
                sl.get<IProfileRepository>(),
              ),
            )
          ], child: ProfileScreen(token)),
        );

      case '/interests':
        List<String> interests_list = routeSettings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => ProfileBloc(sl.get<IProfileRepository>())),
          ], child: Interests(interests_list: interests_list)),
        );

      default:
        return MaterialPageRoute<Scaffold>(builder: (context) {
          return Scaffold(
            body: Center(
                child: Text('No route defined for ${routeSettings.name}')),
          );
        });
    }
  }
}
