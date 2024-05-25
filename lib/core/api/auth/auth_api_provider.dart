import 'package:dio/dio.dart';
import 'package:you_app_task/core/api/auth/i_auth_api_provider.dart';
import 'package:you_app_task/core/api/auth/model/user.dart';
import 'package:you_app_task/core/api/i_api_provider.dart';
import 'package:you_app_task/core/network/i_network_client.dart';

class AuthApiProvider extends IApiProvider implements IAuthApiProvider {
  AuthApiProvider(INetworkClient client) : super(client);

  @override
  Future<Map<String, dynamic>> login(User user) async {
    try {
      var path = 'login';
      var res = await client.post(path, body: user.toJson());
      return res.data;
    } on DioException catch (exception) {
      throw exception;
    }
  }

  @override
  Future<String> register(User user) async {
    try {
      var path = 'register';
      var res = await client.post(path, body: user.toJson());
      return res.data['message'];
    } on DioException catch (exception) {
      throw exception;
    }
  }
}
