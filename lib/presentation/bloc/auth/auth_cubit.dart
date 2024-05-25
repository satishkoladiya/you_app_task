import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_app_task/core/api/auth/model/user.dart';
import 'package:you_app_task/core/repository/i_auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late IAuthRepository authRepo;

  AuthCubit(this.authRepo) : super(AuthLogin());

  void login(User user) async {
    var output = await authRepo.login(user);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    output.fold((exception) => emit(AuthError(exception)), (data) {
      if (data['access_token'] != null) {
        prefs.setString('TOKEN', data['access_token']);
        emit(AuthLoggedIn(data['access_token']!));
      } else
        emit(AuthError(Exception(data['message'])));
    });
  }

  void register(User user) async {
    var output = await authRepo.register(user);
    output.fold((exception) => emit(AuthError(exception)), (data) {
      emit(AuthRegistered());
    });
  }
}
