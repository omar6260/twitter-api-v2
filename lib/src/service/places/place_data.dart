// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'place_geo.dart';

part 'place_data.freezed.dart';
part 'place_data.g.dart';

@freezed
class PlaceData with _$PlaceData {
  const factory PlaceData({
    required String fullName,
    required String id,
    List<String>? containedWithin,
    String? country,
    String? countryCode,
    PlaceGeo? geo,
    String? name,
    String? placeType,
  }) = _PlaceData;

  factory PlaceData.fromJson(Map<String, Object?> json) =>
      _$PlaceDataFromJson(json);
}
