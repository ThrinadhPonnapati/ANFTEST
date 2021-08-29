//
//  ExploreDataCodable.swift
//  ANF Code Test
//
//  Created by  Thrinadh Ponnapati on 8/29/21.
//

import Foundation

// MARK: - ExploreDataModel
struct ExploreDataModel: Codable {
    let title, backgroundImage: String
    let content: [Content]?
    let promoMessage, topDescription, bottomDescription: String?
}

// MARK: - Content
struct Content: Codable {
    let target: String
    let title: String
    let elementType: String?
}

typealias ExploreData = [ExploreDataModel]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

