import 'package:dartz/dartz.dart';
import 'package:you_app_task/core/api/profile/model/profile_data.dart';

abstract class IProfileRepository {
  Future<Either<Exception, ProfileData>> getProfile(String access_token);
  Future<Either<Exception, String>> updateProfile(
      String access_token, ProfileData profileData);
}
