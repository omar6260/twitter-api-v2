// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_user_metrics.freezed.dart';
part 'public_user_metrics.g.dart';

@freezed
class PublicUserMetrics with _$PublicUserMetrics {
  const factory PublicUserMetrics({
    required int followersCount,
    required int followingCount,
    required int tweetCount,
    required int listedCount,
  }) = _PublicUserMetrics;

  factory PublicUserMetrics.fromJson(Map<String, Object?> json) =>
      _$PublicUserMetricsFromJson(json);
}
