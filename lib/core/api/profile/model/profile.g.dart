// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      birthday: json['birthday'] as String?,
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'birthday': instance.birthday,
      'height': instance.height,
      'weight': instance.weight,
      'interests': instance.interests,
    };
