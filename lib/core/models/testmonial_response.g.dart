// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testmonial_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestmonialResponse _$TestmonialResponseFromJson(Map<String, dynamic> json) =>
    TestmonialResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestmonialResponseToJson(TestmonialResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      id: json['id'] as String?,
      liked_by_me: json['liked_by_me'] as bool?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      description: json['description'] as String?,
      image_url: json['image_url'] as String?,
      video_url: json['video_url'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdBy: json['createdBy'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      watched: json['watched'] as bool?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'liked_by_me': instance.liked_by_me,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'description': instance.description,
      'image_url': instance.image_url,
      'video_url': instance.video_url,
      'likes': instance.likes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'watched': instance.watched,
    };
