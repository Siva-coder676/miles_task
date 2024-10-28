import 'package:json_annotation/json_annotation.dart';
part 'testmonial_response.g.dart';

@JsonSerializable()
class TestmonialResponse {
  String? message;
  List<DataResponse>? data;

  TestmonialResponse({this.message, this.data});

  factory TestmonialResponse.fromJson(Map<String, dynamic> json) =>
      _$TestmonialResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TestmonialResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  String? id;
  bool? liked_by_me;
  String? first_name;
  String? last_name;
  String? description;
  String? image_url;
  String? video_url;
  int? likes;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? modifiedBy;
  bool? watched;

  DataResponse(
      {this.id,
      this.liked_by_me,
      this.first_name,
      this.last_name,
      this.description,
      this.image_url,
      this.video_url,
      this.likes,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy,
      this.watched});

  factory DataResponse.fromJson(Map<String, dynamic> json) => _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
