// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Project imports:
import 'package:twitter_api_v2/src/client/client_context.dart';
import 'package:twitter_api_v2/src/client/user_context.dart';
import 'package:twitter_api_v2/src/service/base_service.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_count_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_count_meta.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_meta.dart';
import 'package:twitter_api_v2/src/service/twitter_response.dart';
import 'package:twitter_api_v2/src/service/users/user_data.dart';

abstract class TweetsService {
  /// Returns the new instance of [TweetsService].
  factory TweetsService({required ClientContext context}) =>
      _TweetsService(context: context);

  /// Creates a Tweet on behalf of an authenticated user.
  ///
  /// ## Parameters
  ///
  /// - [text]: Text of the Tweet being created.
  ///           This field is required if media.media_ids is not present.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///     200 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/manage-tweets/api-reference/post-tweets
  Future<TwitterResponse<TweetData, void>> createTweet({required String text});

  /// Allows a user or authenticated user ID to delete a Tweet.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: The Tweet ID you are deleting.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/:id
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/manage-tweets/api-reference/delete-tweets-id
  Future<bool> destroyTweet({required String tweetId});

  /// Causes the user ID identified in the path parameter to Like the target Tweet.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are liking a Tweet on behalf of.
  ///             It must match your own user ID or that of an authenticating user,
  ///             meaning that you must pass the Access Tokens associated with
  ///             the user ID when authenticating your request.
  ///
  /// - [tweetId]: The ID of the Tweet that you would like the user id to Like.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/likes
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///   50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/post-users-id-likes
  Future<bool> createLike({required String userId, required String tweetId});

  /// Allows a user or authenticated user ID to unlike a Tweet.
  ///
  /// The request succeeds with no action when the user sends a request to
  /// a user they're not liking the Tweet or have already unliked the Tweet.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are removing a Like of a Tweet on behalf of.
  ///             It must match your own user ID or that of an authenticating user,
  ///             meaning that you must pass the Access Tokens associated with
  ///             the user ID when authenticating your request.
  ///
  /// - [tweetId]: The ID of the Tweet that you would like the id to unlike.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/likes/:tweet_id
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/delete-users-id-likes-tweet_id
  Future<bool> destroyLike({required String userId, required String tweetId});

  /// Causes the user ID identified in the path parameter to Retweet the target Tweet.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are Retweeting a Tweet on behalf of.
  ///             It must match your own user ID or that of an authenticating user,
  ///             meaning that you must pass the Access Tokens associated with
  ///             the user ID when authenticating your request.
  ///
  /// - [tweetId]: The ID of the Tweet that you would like the user id to Retweet.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/retweets
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/post-users-id-retweets
  Future<bool> createRetweet({required String userId, required String tweetId});

  /// Allows a user or authenticated user ID to remove the Retweet of a Tweet.
  ///
  /// The request succeeds with no action when the user sends a request to
  /// a user they're not Retweeting the Tweet or have already removed the Retweet of.
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are removing a the Retweet of a Tweet on behalf of.
  ///             It must match your own user ID or that of an authenticating user,
  ///             meaning that you must pass the Access Tokens associated with
  ///             the user ID when authenticating your request.
  ///
  /// - [tweetId]: The ID of the Tweet that you would like the id to remove the Retweet of.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/retweets/:source_tweet_id
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/delete-users-id-retweets-tweet_id
  Future<bool> destroyRetweet(
      {required String userId, required String tweetId});

  /// Allows you to get information about a Tweet’s liking users.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Tweet ID of the Tweet to request liking users of.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/:id/liking_users
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///     75 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///     75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-tweets-id-liking_users
  Future<TwitterResponse<List<UserData>, void>> likingUsers(
      {required String tweetId});

  /// Allows you to get information about a user’s liked Tweets.
  ///
  /// ## Parameters
  ///
  /// - [userId]: User ID of the user to request liked Tweets for.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/liked_tweets
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    75 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-users-id-liked_tweets
  Future<TwitterResponse<List<TweetData>, void>> likingTweets(
      {required String userId});

  /// Allows you to get information about who has Retweeted a Tweet.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Tweet ID of the Tweet to request Retweeting users of.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/:id/retweeted_by
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    75 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/get-tweets-id-retweeted_by
  Future<TwitterResponse<List<UserData>, void>> retweetedBy(
      {required String tweetId});

  /// Returns Quote Tweets for a Tweet specified by the requested Tweet ID.
  ///
  /// The Tweets returned by this endpoint count towards the Project-level Tweet cap.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Unique identifier of the Tweet to request.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/:id/quote_tweets
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    75 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/quote-tweets/api-reference/get-tweets-id-quote_tweets
  Future<TwitterResponse<List<TweetData>, TweetMeta>> quoteTweets(
      {required tweetId});

  /// The recent search endpoint returns Tweets from the last seven days that match a search query.
  ///
  /// The Tweets returned by this endpoint count towards the Project-level Tweet cap.
  ///
  /// ## Parameters
  ///
  /// - [query]: One query for matching Tweets. You can learn how to build
  ///            this query by reading our [build a query guide](https://developer.twitter.com/en/docs/twitter-api/tweets/search/integrate/build-a-query).
  ///
  ///            If you have Essential or Elevated access, you can use the Basic
  ///            operators when building your query and can make queries up to
  ///            512 characters long.
  ///
  ///            Learn more about our access levels on the `about Twitter API page`.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/search/recent
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///   450 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///   180 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent
  Future<TwitterResponse<List<TweetData>, TweetMeta>> searchRecent(
      {required String query});

  /// This endpoint is only available to those users who have been approved for
  /// Academic Research access.
  ///
  /// The full-archive search endpoint returns the complete history of public Tweets
  /// matching a search query; since the first Tweet was created March 26, 2006.
  ///
  /// The Tweets returned by this endpoint count towards the Project-level Tweet cap.
  ///
  /// ## Parameters
  ///
  /// - [query]: One query for matching Tweets.
  ///            You can learn how to build this query by reading our build a
  ///            query guide. You can use all available operators and can make
  ///            queries up to 1,024 characters long.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/search/all
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    300 requests per 15-minute window shared among all users of your app
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    1 request per second shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-all
  Future<TwitterResponse<List<TweetData>, TweetMeta>> searchAll(
      {required String query});

  /// Returns a variety of information about a single Tweet specified by the requested ID.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Unique identifier of the Tweet to request.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/:id
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    900 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    900 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets-id
  Future<TwitterResponse<TweetData, void>> lookupTweet(
      {required String tweetId});

  /// Returns a variety of information about the Tweet specified by the requested ID or list of IDs.
  ///
  /// ## Parameters
  ///
  /// - [tweetIds]: Unique identifiers of the Tweet to request.
  ///               Up to 100 are allowed in a single request.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    900 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    900 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets
  Future<TwitterResponse<List<TweetData>, void>> lookupTweets(
      {required List<String> tweetIds});

  /// The recent Tweet counts endpoint returns count of Tweets from the last seven days that match a query.
  ///
  /// ## Parameters
  ///
  /// - [query]: One query for matching Tweets. You can learn how to build
  ///            this query by reading a [build a query guide](https://developer.twitter.com/en/docs/twitter-api/tweets/counts/integrate/build-a-query).
  ///
  ///            If you have Essential or Elevated access, you can use
  ///            the Basic operators when building your query and can make queries
  ///            up to 512 characters long.
  ///
  ///            If you have been approved for Academic Research access,
  ///            you can use all available operators and can make queries
  ///            up to 1,024 characters long.
  ///
  ///            Learn more about our access levels on the `about Twitter API page`.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/counts/recent
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    300 requests per 15-minute window shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-recent
  Future<TwitterResponse<List<TweetCountData>, TweetCountMeta>> countRecent(
      {required String query});

  /// This endpoint is only available to those users who have been approved
  /// for Academic Research access.
  ///
  /// The full-archive Tweet counts endpoint returns the count of Tweets that
  /// match your query from the complete history of public Tweets;
  /// since the first Tweet was created March 26, 2006.
  ///
  /// ## Parameters
  ///
  /// - [query]: One query for matching Tweets.
  ///            You can learn how to build this query by reading a [build a query guide](https://developer.twitter.com/en/docs/twitter-api/tweets/counts/integrate/build-a-query).
  ///            You can use all available operators and can make queries
  ///            up to 1,024 characters long.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets/counts/all
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    300 requests per 15-minute window shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-all
  Future<TwitterResponse<List<TweetCountData>, TweetCountMeta>> countAll(
      {required String query});

  /// Causes the user ID of an authenticated user identified in the path parameter
  /// to Bookmark the target Tweet provided in the request body.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID of an authenticated user who you are bookmarking
  ///             a Tweet on behalf of. It must match your own user ID or
  ///             that of an authenticating user, meaning that you must pass
  ///             the Access Token associated with the user ID when authenticating
  ///             your request.
  ///
  /// - [tweetId]: The ID of the Tweet that you would like the user id to Bookmark.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/bookmarks
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/post-users-id-bookmarks
  Future<bool> createBookmark(
      {required String userId, required String tweetId});

  /// Allows a user or authenticated user ID to remove a Bookmark of a Tweet.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are removing a Bookmark of a Tweet on behalf of.
  ///             It must match your own user ID or that of an authenticating user,
  ///             meaning that you must pass the Access Token associated with
  ///             the user ID when authenticating your request.
  ///
  /// - [tweetId]: The ID of the Tweet that you would like the id to remove a Bookmark of.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/bookmarks/:tweet_id
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/delete-users-id-bookmarks-tweet_id
  Future<bool> destroyBookmark(
      {required String userId, required String tweetId});

  /// Allows you to get information about a authenticated user’s 800 most recent bookmarked Tweets.
  ///
  /// ## Parameters
  ///
  /// - [userId]: User ID of an authenticated user to request bookmarked Tweets for.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/bookmarks/:tweet_id
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    180 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/get-users-id-bookmarks
  Future<TwitterResponse<List<TweetData>, TweetMeta>> bookmarks(
      {required String userId});
}

class _TweetsService extends BaseService implements TweetsService {
  /// Returns the new instance of [_TweetsService].
  _TweetsService({required ClientContext context}) : super(context: context);

  @override
  Future<TwitterResponse<TweetData, void>> createTweet(
      {required String text}) async {
    final response = await super.post(
      UserContext.oauth2,
      '/2/tweets',
      body: {'text': text},
    );

    return TwitterResponse(data: TweetData.fromJson(response['data']));
  }

  @override
  Future<bool> destroyTweet({required String tweetId}) async {
    final response = await super.delete(
      UserContext.oauth2,
      '/2/tweets/$tweetId',
    );

    return response['data']['deleted'];
  }

  @override
  Future<bool> createLike({
    required String userId,
    required String tweetId,
  }) async {
    final response = await super.post(
      UserContext.oauth2,
      '/2/users/$userId/likes',
      body: {'tweet_id': tweetId},
    );

    return response['data']['liked'];
  }

  @override
  Future<bool> destroyLike({
    required String userId,
    required String tweetId,
  }) async {
    final response = await super.delete(
      UserContext.oauth2,
      '/2/users/$userId/likes/$tweetId',
    );

    return !response['data']['liked'];
  }

  @override
  Future<bool> createRetweet({
    required String userId,
    required String tweetId,
  }) async {
    final response = await super.post(
      UserContext.oauth2,
      '/2/users/$userId/retweets',
      body: {'tweet_id': tweetId},
    );

    return response['data']['retweeted'];
  }

  @override
  Future<bool> destroyRetweet({
    required String userId,
    required String tweetId,
  }) async {
    final response = await super.delete(
      UserContext.oauth2,
      '/2/users/$userId/retweets/$tweetId',
    );

    return !response['data']['retweeted'];
  }

  @override
  Future<TwitterResponse<List<UserData>, void>> likingUsers(
      {required String tweetId}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/tweets/$tweetId/liking_users',
    );

    return TwitterResponse(
      data: response['data']
          .map<UserData>((user) => UserData.fromJson(user))
          .toList(),
    );
  }

  @override
  Future<TwitterResponse<List<TweetData>, void>> likingTweets(
      {required String userId}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/users/$userId/liked_tweets',
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetData>((tweet) => TweetData.fromJson(tweet))
          .toList(),
    );
  }

  @override
  Future<TwitterResponse<List<UserData>, void>> retweetedBy(
      {required String tweetId}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/tweets/$tweetId/retweeted_by',
    );

    return TwitterResponse(
      data: response['data']
          .map<UserData>((user) => UserData.fromJson(user))
          .toList(),
    );
  }

  @override
  Future<TwitterResponse<List<TweetData>, TweetMeta>> quoteTweets(
      {required tweetId}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/tweets/$tweetId/quote_tweets',
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetData>((tweet) => TweetData.fromJson(tweet))
          .toList(),
      meta: TweetMeta.fromJson(response),
    );
  }

  @override
  Future<TwitterResponse<List<TweetData>, TweetMeta>> searchRecent(
      {required String query}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/tweets/search/recent',
      queryParameters: {'query': query},
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetData>((tweet) => TweetData.fromJson(tweet))
          .toList(),
      meta: TweetMeta.fromJson(response['meta']),
    );
  }

  @override
  Future<TwitterResponse<List<TweetData>, TweetMeta>> searchAll(
      {required String query}) async {
    final response = await super.get(
      UserContext.oauth2AppOnly,
      '/2/tweets/search/all',
      queryParameters: {'query': query},
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetData>((tweet) => TweetData.fromJson(tweet))
          .toList(),
      meta: TweetMeta.fromJson(response['meta']),
    );
  }

  @override
  Future<TwitterResponse<TweetData, void>> lookupTweet(
      {required String tweetId}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/tweets/$tweetId',
    );

    return TwitterResponse(
      data: TweetData.fromJson(response['data']),
    );
  }

  @override
  Future<TwitterResponse<List<TweetData>, void>> lookupTweets(
      {required List<String> tweetIds}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/tweets',
      queryParameters: {'ids': tweetIds.join(',')},
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetData>((tweet) => TweetData.fromJson(tweet))
          .toList(),
    );
  }

  @override
  Future<TwitterResponse<List<TweetCountData>, TweetCountMeta>> countRecent(
      {required String query}) async {
    final response = await super.get(
      UserContext.oauth2AppOnly,
      '/2/tweets/counts/recent',
      queryParameters: {'query': query},
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetCountData>(
              (tweetCount) => TweetCountData.fromJson(tweetCount))
          .toList(),
      meta: TweetCountMeta.fromJson(response['meta']),
    );
  }

  @override
  Future<TwitterResponse<List<TweetCountData>, TweetCountMeta>> countAll(
      {required String query}) async {
    final response = await super.get(
      UserContext.oauth2AppOnly,
      '/2/tweets/counts/all',
      queryParameters: {'query': query},
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetCountData>(
              (tweetCount) => TweetCountData.fromJson(tweetCount))
          .toList(),
      meta: TweetCountMeta.fromJson(response['meta']),
    );
  }

  @override
  Future<bool> createBookmark({
    required String userId,
    required String tweetId,
  }) async {
    final response = await super.post(
      UserContext.oauth2,
      '/2/users/$userId/bookmarks',
      body: {'tweet_id': tweetId},
    );

    return response['data']['bookmarked'];
  }

  @override
  Future<bool> destroyBookmark({
    required String userId,
    required String tweetId,
  }) async {
    final response = await super.delete(
      UserContext.oauth2,
      '/2/users/$userId/bookmarks/$tweetId',
    );

    return !response['data']['bookmarked'];
  }

  @override
  Future<TwitterResponse<List<TweetData>, TweetMeta>> bookmarks(
      {required String userId}) async {
    final response = await super.get(
      UserContext.oauth2,
      '/2/users/$userId/bookmarks',
    );

    return TwitterResponse(
      data: response['data']
          .map<TweetData>((tweet) => TweetData.fromJson(tweet))
          .toList(),
      meta: TweetMeta.fromJson(response['meta']),
    );
  }
}
