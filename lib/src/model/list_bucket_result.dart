library list_bucket_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aws_s3_client/src/model/list_bucket_result_contents.dart';

import 'serializers.dart';

part 'list_bucket_result.g.dart';

abstract class ListBucketResult
    implements Built<ListBucketResult, ListBucketResultBuilder> {
  ListBucketResult._();

  factory ListBucketResult([updates(ListBucketResultBuilder b)]) =
      _$ListBucketResult;

  @BuiltValueField(wireName: 'Name')
  String get name;

  @BuiltValueField(wireName: 'Prefix')
  String get prefix;

  @BuiltValueField(wireName: 'MaxKeys')
  String get maxKeys;

  @BuiltValueField(wireName: 'KeyCount')
  @nullable
  String get keyCount;

  @BuiltValueField(wireName: 'IsTruncated')
  String get isTruncated;

  @BuiltValueField(wireName: 'Contents')
  @nullable
  BuiltList<Contents> get contents;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ListBucketResult.serializer, this));
  }

  static ListBucketResult fromJson(String jsonString) {
    return serializers.deserializeWith(
        ListBucketResult.serializer, json.decode(jsonString));
  }

  static Serializer<ListBucketResult> get serializer =>
      _$listBucketResultSerializer;
}
