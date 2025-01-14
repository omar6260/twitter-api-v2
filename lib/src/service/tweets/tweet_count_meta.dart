// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet_count_meta.freezed.dart';
part 'tweet_count_meta.g.dart';

@freezed
class TweetCountMeta with _$TweetCountMeta {
  const factory TweetCountMeta({
    @JsonKey(name: 'total_tweet_count') required int total,
    String? nextToken,
  }) = _TweetCountMeta;

  factory TweetCountMeta.fromJson(Map<String, Object?> json) =>
      _$TweetCountMetaFromJson(json);
}
