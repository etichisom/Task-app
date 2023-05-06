import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
class PostData with _$PostData {
  const factory PostData({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}
