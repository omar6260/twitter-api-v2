// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:test/test.dart';
import 'package:twitter_api_v2/src/service/users/user_expansion.dart';

void main() {
  test('.name', () {
    expect(UserExpansion.pinnedTweetId.name, 'pinnedTweetId');
  });

  test('.fieldName', () {
    expect(UserExpansion.pinnedTweetId.fieldName, 'pinned_tweet_id');
  });
}
