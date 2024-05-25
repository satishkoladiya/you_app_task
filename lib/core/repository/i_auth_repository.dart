import 'package:dartz/dartz.dart';
import 'package:you_app_task/core/api/auth/model/user.dart';

abstract class IAuthRepository {
  Future<Either<Exception, String>> register(User user);
  Future<Either<Exception, Map<String, dynamic>>> login(User user);
}
