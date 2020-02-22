//
//  Tweets.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 04/02/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//


import Foundation

// MARK: - Welcome
struct Tweets: Codable {
    var statuses: [Status]?
    var searchMetadata: SearchMetadata?

    enum CodingKeys: String, CodingKey {
        case statuses
        case searchMetadata = "search_metadata"
    }
}

// MARK: - SearchMetadata
struct SearchMetadata: Codable {
    var completedIn, maxID: Double?
    var maxIDStr, nextResults, query, refreshURL: String?
    var count, sinceID: Int?
    var sinceIDStr: String?

    enum CodingKeys: String, CodingKey {
        case completedIn = "completed_in"
        case maxID = "max_id"
        case maxIDStr = "max_id_str"
        case nextResults = "next_results"
        case query
        case refreshURL = "refresh_url"
        case count
        case sinceID = "since_id"
        case sinceIDStr = "since_id_str"
    }
}

// MARK: - Status
struct Status: Codable {
    var createdAt: String?
    var id: Double?
    var idStr, text: String?
    var truncated: Bool?
    var entities: StatusEntities?
    var extendedEntities: StatusExtendedEntities?
    var metadata: Metadata?
    var source: String?
    var inReplyToStatusID,inReplyToUserID: Int?
    var inReplyToStatusIDStr , inReplyToUserIDStr: String?
    var inReplyToScreenName: String?
    var user: User?
    var geo, coordinates, contributors: String?
    var isQuoteStatus: Bool?
    var retweetCount, favoriteCount: Int?
    var favorited, retweeted, possiblySensitive: Bool?
    var lang: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case idStr = "id_str"
        case text, truncated, entities
        case extendedEntities = "extended_entities"
        case metadata, source
        case inReplyToStatusID = "in_reply_to_status_id"
        case inReplyToStatusIDStr = "in_reply_to_status_id_str"
        case inReplyToUserID = "in_reply_to_user_id"
        case inReplyToUserIDStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case user, geo, coordinates, contributors
        case isQuoteStatus = "is_quote_status"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case favorited, retweeted
        case possiblySensitive = "possibly_sensitive"
        case lang
    }
}

// MARK: - StatusEntities
struct StatusEntities: Codable {
    var hashtags: [Hashtag]?
    var userMentions: [UserMention]?
    var urls: [URLElement]?
    var media: [PurpleMedia]?

    enum CodingKeys: String, CodingKey {
        case hashtags
        case userMentions = "user_mentions"
        case urls, media
    }
}

// MARK: - Hashtag
struct Hashtag: Codable {
    var text: String?
    var indices: [Int]?
}

// MARK: - PurpleMedia
struct PurpleMedia: Codable {
    var id: Double?
    var idStr: String?
    var indices: [Int]?
    var mediaURL: String?
    var mediaURLHTTPS: String?
    var url: String?
    var displayURL: String?
    var expandedURL: String?
    var type: String?
    var sizes: Sizes?
    var sourceStatusID: Double?
    var sourceStatusIDStr: String?
    var sourceUserID: Int?
    var sourceUserIDStr: String?
    var videoInfo: VideoInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case indices
        case mediaURL = "media_url"
        case mediaURLHTTPS = "media_url_https"
        case url
        case displayURL = "display_url"
        case expandedURL = "expanded_url"
        case type, sizes
        case sourceStatusID = "source_status_id"
        case sourceStatusIDStr = "source_status_id_str"
        case sourceUserID = "source_user_id"
        case sourceUserIDStr = "source_user_id_str"
        case videoInfo = "video_info"
    }
}

// MARK: - Sizes
struct Sizes: Codable {
    var thumb, medium, small, large: Large?
}

// MARK: - Large
struct Large: Codable {
    var w, h: Int?
    var resize: Resize?
}

enum Resize: String, Codable {
    case crop = "crop"
    case fit = "fit"
}

// MARK: - VideoInfo
struct VideoInfo: Codable {
    var aspectRatio: [Int]?
    var variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case variants
    }
}

// MARK: - Variant
struct Variant: Codable {
    var bitrate: Int?
    var contentType: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case bitrate
        case contentType = "content_type"
        case url
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    var url, expandedURL: String?
    var displayURL: String?
    var indices: [Int]?

    enum CodingKeys: String, CodingKey {
        case url
        case expandedURL = "expanded_url"
        case displayURL = "display_url"
        case indices
    }
}

// MARK: - UserMention
struct UserMention: Codable {
    var screenName, name: String?
    var id: Double?
    var idStr: String?
    var indices: [Int]?

    enum CodingKeys: String, CodingKey {
        case screenName = "screen_name"
        case name, id
        case idStr = "id_str"
        case indices
    }
}

// MARK: - StatusExtendedEntities
struct StatusExtendedEntities: Codable {
    var media: [PurpleMedia]?
}

// MARK: - Metadata
struct Metadata: Codable {
    var isoLanguageCode, resultType: String?

    enum CodingKeys: String, CodingKey {
        case isoLanguageCode = "iso_language_code"
        case resultType = "result_type"
    }
}

// MARK: - RetweetedStatus
struct RetweetedStatus: Codable {
    var createdAt: String?
    var id: Double?
    var idStr, text: String?
    var truncated: Bool?
    var entities: RetweetedStatusEntities?
    var metadata: Metadata?
    var source: String?
    var inReplyToStatusIDStr, inReplyToUserIDStr: String?
    var inReplyToStatusID,inReplyToUserID: Int?
    var inReplyToScreenName: String?
    var user: User?
    var geo, coordinates, place, contributors: String?
    var isQuoteStatus: Bool?
    var retweetCount, favoriteCount: Int?
    var favorited, retweeted, possiblySensitive: Bool?
    var lang: String?
    var extendedEntities: RetweetedStatusExtendedEntities?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case idStr = "id_str"
        case text, truncated, entities, metadata, source
        case inReplyToStatusID = "in_reply_to_status_id"
        case inReplyToStatusIDStr = "in_reply_to_status_id_str"
        case inReplyToUserID = "in_reply_to_user_id"
        case inReplyToUserIDStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case user, geo, coordinates, place, contributors
        case isQuoteStatus = "is_quote_status"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case favorited, retweeted
        case possiblySensitive = "possibly_sensitive"
        case lang
        case extendedEntities = "extended_entities"
    }
}

// MARK: - RetweetedStatusEntities
struct RetweetedStatusEntities: Codable {
    var hashtags: [Hashtag]?
    var userMentions: [UserMention]?
    var urls: [URLElement]?
    var media: [FluffyMedia]?

    enum CodingKeys: String, CodingKey {
        case hashtags
        case userMentions = "user_mentions"
        case urls, media
    }
}

// MARK: - FluffyMedia
struct FluffyMedia: Codable {
    var id: Double?
    var idStr: String?
    var indices: [Int]?
    var mediaURL: String?
    var mediaURLHTTPS: String?
    var url: String?
    var displayURL: String?
    var expandedURL: String?
    var type: String?
    var sizes: Sizes?
    var videoInfo: VideoInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case indices
        case mediaURL = "media_url"
        case mediaURLHTTPS = "media_url_https"
        case url
        case displayURL = "display_url"
        case expandedURL = "expanded_url"
        case type, sizes
        case videoInfo = "video_info"
    }
}


// MARK: - RetweetedStatusExtendedEntities
struct RetweetedStatusExtendedEntities: Codable {
    var media: [FluffyMedia]?
}

// MARK: - User
struct User: Codable {
    var id: Double?
    var idStr, name, screenName, location: String?
    var userDescription: String?
    var url: String?
    var entities: UserEntities?
    var protected: Bool?
    var followersCount, friendsCount, listedCount: Int?
    var createdAt: String?
    var favouritesCount: Int?
    var utcOffset, timeZone: String?
    var geoEnabled, verified: Bool?
    var statusesCount: Int?
    var lang: String?
    var contributorsEnabled, isTranslator, isTranslationEnabled: Bool?
    var profileBackgroundColor: String?
    var profileBackgroundImageURL: String?
    var profileBackgroundImageURLHTTPS: String?
    var profileBackgroundTile: Bool?
    var profileImageURL: String?
    var profileImageURLHTTPS: String?
    var profileBannerURL: String?
    var profileLinkColor, profileSidebarBorderColor, profileSidebarFillColor, profileTextColor: String?
    var profileUseBackgroundImage, hasExtendedProfile, defaultProfile, defaultProfileImage: Bool?
    var following, followRequestSent, notifications: Bool?
    var translatorType: String?

    enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case name
        case screenName = "screen_name"
        case location
        case userDescription = "description"
        case url, entities, protected
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case listedCount = "listed_count"
        case createdAt = "created_at"
        case favouritesCount = "favourites_count"
        case utcOffset = "utc_offset"
        case timeZone = "time_zone"
        case geoEnabled = "geo_enabled"
        case verified
        case statusesCount = "statuses_count"
        case lang
        case contributorsEnabled = "contributors_enabled"
        case isTranslator = "is_translator"
        case isTranslationEnabled = "is_translation_enabled"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageURL = "profile_background_image_url"
        case profileBackgroundImageURLHTTPS = "profile_background_image_url_https"
        case profileBackgroundTile = "profile_background_tile"
        case profileImageURL = "profile_image_url"
        case profileImageURLHTTPS = "profile_image_url_https"
        case profileBannerURL = "profile_banner_url"
        case profileLinkColor = "profile_link_color"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileTextColor = "profile_text_color"
        case profileUseBackgroundImage = "profile_use_background_image"
        case hasExtendedProfile = "has_extended_profile"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
        case following
        case followRequestSent = "follow_request_sent"
        case notifications
        case translatorType = "translator_type"
    }
}


// MARK: - UserEntities
struct UserEntities: Codable {
    var url, entitiesDescription: Description?

    enum CodingKeys: String, CodingKey {
        case url
        case entitiesDescription = "description"
    }
}


// MARK: - Description
struct Description: Codable {
    var urls: [URLElement]?
}

