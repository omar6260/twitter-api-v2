// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'includes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Includes _$IncludesFromJson(Map<String, dynamic> json) {
  return _Includes.fromJson(json);
}

/// @nodoc
mixin _$Includes {
  List<TweetData>? get tweets => throw _privateConstructorUsedError;
  List<UserData>? get users => throw _privateConstructorUsedError;
  List<MediaData>? get media => throw _privateConstructorUsedError;
  List<PlaceData>? get places => throw _privateConstructorUsedError;
  List<PollData>? get polls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncludesCopyWith<Includes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncludesCopyWith<$Res> {
  factory $IncludesCopyWith(Includes value, $Res Function(Includes) then) =
      _$IncludesCopyWithImpl<$Res>;
  $Res call(
      {List<TweetData>? tweets,
      List<UserData>? users,
      List<MediaData>? media,
      List<PlaceData>? places,
      List<PollData>? polls});
}

/// @nodoc
class _$IncludesCopyWithImpl<$Res> implements $IncludesCopyWith<$Res> {
  _$IncludesCopyWithImpl(this._value, this._then);

  final Includes _value;
  // ignore: unused_field
  final $Res Function(Includes) _then;

  @override
  $Res call({
    Object? tweets = freezed,
    Object? users = freezed,
    Object? media = freezed,
    Object? places = freezed,
    Object? polls = freezed,
  }) {
    return _then(_value.copyWith(
      tweets: tweets == freezed
          ? _value.tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as List<TweetData>?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaData>?,
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceData>?,
      polls: polls == freezed
          ? _value.polls
          : polls // ignore: cast_nullable_to_non_nullable
              as List<PollData>?,
    ));
  }
}

/// @nodoc
abstract class _$$_IncludesCopyWith<$Res> implements $IncludesCopyWith<$Res> {
  factory _$$_IncludesCopyWith(
          _$_Includes value, $Res Function(_$_Includes) then) =
      __$$_IncludesCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TweetData>? tweets,
      List<UserData>? users,
      List<MediaData>? media,
      List<PlaceData>? places,
      List<PollData>? polls});
}

/// @nodoc
class __$$_IncludesCopyWithImpl<$Res> extends _$IncludesCopyWithImpl<$Res>
    implements _$$_IncludesCopyWith<$Res> {
  __$$_IncludesCopyWithImpl(
      _$_Includes _value, $Res Function(_$_Includes) _then)
      : super(_value, (v) => _then(v as _$_Includes));

  @override
  _$_Includes get _value => super._value as _$_Includes;

  @override
  $Res call({
    Object? tweets = freezed,
    Object? users = freezed,
    Object? media = freezed,
    Object? places = freezed,
    Object? polls = freezed,
  }) {
    return _then(_$_Includes(
      tweets: tweets == freezed
          ? _value._tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as List<TweetData>?,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      media: media == freezed
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaData>?,
      places: places == freezed
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceData>?,
      polls: polls == freezed
          ? _value._polls
          : polls // ignore: cast_nullable_to_non_nullable
              as List<PollData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Includes implements _Includes {
  const _$_Includes(
      {final List<TweetData>? tweets,
      final List<UserData>? users,
      final List<MediaData>? media,
      final List<PlaceData>? places,
      final List<PollData>? polls})
      : _tweets = tweets,
        _users = users,
        _media = media,
        _places = places,
        _polls = polls;

  factory _$_Includes.fromJson(Map<String, dynamic> json) =>
      _$$_IncludesFromJson(json);

  final List<TweetData>? _tweets;
  @override
  List<TweetData>? get tweets {
    final value = _tweets;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserData>? _users;
  @override
  List<UserData>? get users {
    final value = _users;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaData>? _media;
  @override
  List<MediaData>? get media {
    final value = _media;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PlaceData>? _places;
  @override
  List<PlaceData>? get places {
    final value = _places;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PollData>? _polls;
  @override
  List<PollData>? get polls {
    final value = _polls;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Includes(tweets: $tweets, users: $users, media: $media, places: $places, polls: $polls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Includes &&
            const DeepCollectionEquality().equals(other._tweets, _tweets) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            const DeepCollectionEquality().equals(other._polls, _polls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tweets),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_media),
      const DeepCollectionEquality().hash(_places),
      const DeepCollectionEquality().hash(_polls));

  @JsonKey(ignore: true)
  @override
  _$$_IncludesCopyWith<_$_Includes> get copyWith =>
      __$$_IncludesCopyWithImpl<_$_Includes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncludesToJson(this);
  }
}

abstract class _Includes implements Includes {
  const factory _Includes(
      {final List<TweetData>? tweets,
      final List<UserData>? users,
      final List<MediaData>? media,
      final List<PlaceData>? places,
      final List<PollData>? polls}) = _$_Includes;

  factory _Includes.fromJson(Map<String, dynamic> json) = _$_Includes.fromJson;

  @override
  List<TweetData>? get tweets => throw _privateConstructorUsedError;
  @override
  List<UserData>? get users => throw _privateConstructorUsedError;
  @override
  List<MediaData>? get media => throw _privateConstructorUsedError;
  @override
  List<PlaceData>? get places => throw _privateConstructorUsedError;
  @override
  List<PollData>? get polls => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_IncludesCopyWith<_$_Includes> get copyWith =>
      throw _privateConstructorUsedError;
}
