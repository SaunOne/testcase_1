// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CacheEntryImpl _$$CacheEntryImplFromJson(Map<String, dynamic> json) =>
    _$CacheEntryImpl(
      key: json['key'] as String,
      data: json['data'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      ttlSeconds: (json['ttlSeconds'] as num).toInt(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$CacheEntryImplToJson(_$CacheEntryImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'data': instance.data,
      'createdAt': instance.createdAt.toIso8601String(),
      'ttlSeconds': instance.ttlSeconds,
      'tags': instance.tags,
    };
