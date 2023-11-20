//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation

class MisconceptionModel: Codable {
    var id = UUID()
    var misconception: String?
    var rolemodelName: String?
    var quotes: [String]?
    var video: String?

    enum CodingKeys: String, CodingKey {
        case misconception = "Misconception"
        case quotes = "Quote / Fact"
        case rolemodelName = "Citation"
        case video = "Video file name"
    }

    // Custom initializer for decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.misconception = try container.decodeIfPresent(String.self, forKey: .misconception)
        self.rolemodelName = try container.decodeIfPresent(String.self, forKey: .rolemodelName)
        self.quotes = try container.decodeIfPresent(String.self, forKey: .quotes).map { [$0] }
        self.video = try container.decodeIfPresent(String.self, forKey: .video)
    }

    // Custom encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(misconception, forKey: .misconception)
        try container.encode(quotes, forKey: .quotes)
        try container.encode(video, forKey: .video)
        try container.encode(rolemodelName, forKey: .rolemodelName)
    }
}
