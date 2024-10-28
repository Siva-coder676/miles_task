// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageResponse _$HomePageResponseFromJson(Map<String, dynamic> json) =>
    HomePageResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageResponseToJson(HomePageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      blockType: json['blockType'] as String?,
      name: json['name'] as String?,
      heading: json['heading'] as String?,
      position: (json['position'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      vertical: json['vertical'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Posts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'blockType': instance.blockType,
      'name': instance.name,
      'heading': instance.heading,
      'position': instance.position,
      'count': instance.count,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'vertical': instance.vertical,
      'modifiedBy': instance.modifiedBy,
      'posts': instance.posts,
    };

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
      id: json['id'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => Files.fromJson(e as Map<String, dynamic>))
          .toList(),
      likedByMe: json['likedByMe'] as bool?,
      title: json['title'] as String?,
      postType: json['postType'] as String?,
      description: json['description'] as String?,
      metadata: json['metadata'] as String?,
      fullVideoUrl: json['fullVideoUrl'] as String?,
      blogUrl: json['blogUrl'] as String?,
      active: json['active'] as bool?,
      featured: json['featured'] as bool?,
      priority: (json['priority'] as num?)?.toInt(),
      likes: (json['likes'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdBy: json['createdBy'] as String?,
      layout: json['layout'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
    );

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'id': instance.id,
      'files': instance.files,
      'likedByMe': instance.likedByMe,
      'title': instance.title,
      'postType': instance.postType,
      'description': instance.description,
      'metadata': instance.metadata,
      'fullVideoUrl': instance.fullVideoUrl,
      'blogUrl': instance.blogUrl,
      'active': instance.active,
      'featured': instance.featured,
      'priority': instance.priority,
      'likes': instance.likes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'layout': instance.layout,
      'modifiedBy': instance.modifiedBy,
    };

Files _$FilesFromJson(Map<String, dynamic> json) => Files(
      id: json['id'] as String?,
      mediaType: json['mediaType'] as String?,
      video_url: json['video_url'] as String?,
      thumbnail: json['thumbnail'] as String?,
      imagePath: json['imagePath'] as String?,
      mediaOrder: (json['mediaOrder'] as num?)?.toInt(),
      active: json['active'] as bool?,
      post: json['post'] as String?,
    );

Map<String, dynamic> _$FilesToJson(Files instance) => <String, dynamic>{
      'id': instance.id,
      'mediaType': instance.mediaType,
      'video_url': instance.video_url,
      'thumbnail': instance.thumbnail,
      'imagePath': instance.imagePath,
      'mediaOrder': instance.mediaOrder,
      'active': instance.active,
      'post': instance.post,
    };
