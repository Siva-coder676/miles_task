import 'package:json_annotation/json_annotation.dart';
part'home_page_response.g.dart';


@JsonSerializable()
class HomePageResponse {
  List<Data>? data;

  HomePageResponse({this.data});

  factory HomePageResponse.fromJson(Map<String, dynamic> json)=>_$HomePageResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$HomePageResponseToJson(this);
}

@JsonSerializable()

class Data {
  String? id;
  String? blockType;
  String? name;
  String? heading;
  int? position;
  int? count;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? vertical;
  String? modifiedBy;
  List<Posts>? posts;

  Data(
      {this.id,
      this.blockType,
      this.name,
      this.heading,
      this.position,
      this.count,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.vertical,
      this.modifiedBy,
      this.posts});

  factory Data.fromJson(Map<String, dynamic> json)=>_$DataFromJson(json); 

  Map<String, dynamic> toJson()=>_$DataToJson(this); 
}

@JsonSerializable()

class Posts {
  String? id;
  List<Files>? files;
  bool? likedByMe;
  String? title;
  String? postType;
  String? description;
  String? metadata;
  String? fullVideoUrl;
  String? blogUrl;
  bool? active;
  bool? featured;
  int? priority;
  int? likes;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? layout;
  String? modifiedBy;

  Posts(
      {this.id,
      this.files,
      this.likedByMe,
      this.title,
      this.postType,
      this.description,
      this.metadata,
      this.fullVideoUrl,
      this.blogUrl,
      this.active,
      this.featured,
      this.priority,
      this.likes,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.layout,
      this.modifiedBy});

 factory Posts.fromJson(Map<String, dynamic> json) =>_$PostsFromJson(json);

  Map<String, dynamic> toJson()=>_$PostsToJson(this);
}


@JsonSerializable()
class Files {
  String? id;
  String? mediaType;
  String? video_url;
  String? thumbnail;
  String? imagePath;
  int? mediaOrder;
  bool? active;
  String? post;

  Files(
      {this.id,
      this.mediaType,
      this.video_url,
      this.thumbnail,
      this.imagePath,
      this.mediaOrder,
      this.active,
      this.post});

  factory Files.fromJson(Map<String, dynamic> json)=>_$FilesFromJson(json);

  Map<String, dynamic> toJson()=>_$FilesToJson(this); 
}