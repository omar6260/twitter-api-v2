// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_rule.freezed.dart';
part 'matching_rule.g.dart';

@freezed
class MatchingRule with _$MatchingRule {
  const factory MatchingRule({
    required String id,
    required String tag,
  }) = _MatchingRule;

  factory MatchingRule.fromJson(Map<String, Object?> json) =>
      _$MatchingRuleFromJson(json);
}
