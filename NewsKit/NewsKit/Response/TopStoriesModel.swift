//
//  TopStoriesModel.swift
//  NewsKit
//
//  Created by cagla copuroglu on 11.11.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topStoriesModel = try? newJSONDecoder().decode(TopStoriesModel.self, from: jsonData)

import Foundation

// MARK: - TopStoriesModel
public struct TopStoriesModel: Codable {
    public let meta: Meta
    public let data: [Datum]

    public init(meta: Meta, data: [Datum]) {
        self.meta = meta
        self.data = data
    }
}

// MARK: - Datum
public struct Datum: Codable {
    public let uuid, title, datumDescription, keywords: String
    public let snippet: String
    public let url: String
    public let imageURL: String
    public let language, publishedAt, source: String
    public let categories: [String]
    public let relevanceScore: JSONNull?
    public let locale: String

    enum CodingKeys: String, CodingKey {
        case uuid, title
        case datumDescription = "description"
        case keywords, snippet, url
        case imageURL = "image_url"
        case language
        case publishedAt = "published_at"
        case source, categories
        case relevanceScore = "relevance_score"
        case locale
    }

    public init(uuid: String, title: String, datumDescription: String, keywords: String, snippet: String, url: String, imageURL: String, language: String, publishedAt: String, source: String, categories: [String], relevanceScore: JSONNull?, locale: String) {
        self.uuid = uuid
        self.title = title
        self.datumDescription = datumDescription
        self.keywords = keywords
        self.snippet = snippet
        self.url = url
        self.imageURL = imageURL
        self.language = language
        self.publishedAt = publishedAt
        self.source = source
        self.categories = categories
        self.relevanceScore = relevanceScore
        self.locale = locale
    }
}

// MARK: - Meta
public struct Meta: Codable {
    public let found, returned, limit, page: Int

    public init(found: Int, returned: Int, limit: Int, page: Int) {
        self.found = found
        self.returned = returned
        self.limit = limit
        self.page = page
    }
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
